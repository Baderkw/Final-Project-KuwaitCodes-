//
//  Competiton.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/11/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation
import UIKit

class Competition {
    var name: String
    var date: String
    var city: String
    var url : String
    var image: UIImage?
    var id = UUID()
    
    init(name: String, date: String, city: String, url: String) {
        self.name = name
        self.date = date
        self.city = city
        self.url =  url
        getImageURL()
    }
    
    func getImageURL() {
        
        guard let api = URL(string: "https://pixabay.com/api/?key=17509029-5d8e85093be02a08ceda9b0aa&q=\(replacingSpacesWithPlus())&image_type=photo")else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: api) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

                    let hits = json?["hits"] as? [[String : Any]]
                    if hits?.count == 0 {
                        return
                    }
                    guard let imageURL = URL(string: hits?[0]["largeImageURL"] as! String)else {return}
                    self.downloadImage(from: imageURL)
                }catch {
                    fatalError()
                }
            }
        }.resume()
    }
    
    func replacingSpacesWithPlus() -> String{
        var cityName = self.city
        cityName = self.city.replacingOccurrences(of: ", ", with: "+")
        cityName = self.city.replacingOccurrences(of: " ", with: "+")
        print(self.city)
        return cityName
    }
    
    func getImage(from url: URL) {
        self.downloadImage(from: url)
    }
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async {
                self.image = UIImage(data: data)!
            }
        }
    }
}
