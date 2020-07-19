//
//  ContentView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/7/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var menuIsShown = false
    @State var currentView = "Home"
    @State var competitons = [Competition]()
    @State var isSignedIn = false
    @State var tutorialView : String? = nil
    @State var f2ls = [Step]()
    @State var olls = [Step]()
    @State var plls = [Step]()
    
    var body: some View {
        
        VStack {
            ZStack {
                
                if !self.isSignedIn {
                    Sign(isSignedIn: self.$isSignedIn)
                }else {
                    SideBar(selectedView: self.$currentView, isShown: self.$menuIsShown,isSignedIn: self.$isSignedIn)
                    
                    NavigationView {
                        
                        ZStack{
                            Image("background")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .scaledToFill()
                            VStack {
                                if self.currentView == "Home"{
                                    Home(view: self.$tutorialView)
                                    
                                }else if self.currentView == "Timer" {
                                    CubeTimerView()
                                }else {
                                    UpcomingCompetitionsView(competitions: self.$competitons)
                                }
                            }
                            
                             NavigationLink(destination: F2LView(selectedView: self.$tutorialView, f2ls: self.$f2ls), tag: "F2L", selection: self.$tutorialView) {
                                Text("")
                            }
                            NavigationLink(destination: OLLView(selectedView: self.$tutorialView, olls: self.$olls), tag: "OLL", selection: self.$tutorialView) {
                                Text("")
                            }
                            NavigationLink(destination: PLLView(selectedView: self.$tutorialView, plls: self.$plls), tag: "PLL", selection: self.$tutorialView) {
                                Text("")
                            }
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    MenuView(animate: self.$menuIsShown)
                                }
                                    
                                .padding([.top], 30)
                                Spacer()
                            }
                              
                        }
                    }
                    .offset(x: self.menuIsShown ? -255 : 0)
                    .transition(.asymmetric(insertion: .slide, removal: .slide))
                    .edgesIgnoringSafeArea(.all)
                    .onAppear(perform: getCompetitions)
                    .onAppear(perform: getAllData)
                    .gesture(
                        DragGesture()
                            .onEnded({ (value) in
                                if self.tutorialView == nil {
                                    if value.translation.width > 0 {
                                        withAnimation{
                                            self.menuIsShown = false
                                        }
                                    }else {
                                        withAnimation{
                                            self.menuIsShown = true
                                        }
                                    }
                                }
                            }))
                }
            }
            .onAppear(perform: checkSignedIn)
        }
    }
    
    func checkSignedIn() {
        if Auth.auth().currentUser != nil {
            self.isSignedIn = true
        }
    }
    
    
    func getAllData() {
        DispatchQueue.main.async {
            self.getF2L()
            self.getOLL()
            self.getPLL()
        }
    }
    
    func getF2L() {
        Networking.getListOf(COLLECTION_NAME: "F2L", success: { (array : [F2L]) in
            for f2l in array {
                let ref = Storage.storage().reference(withPath: f2l.imagePath())
                ref.getData(maxSize: 3 * 1024 * 1024) { (data, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    if let data = data {
                        let step = Step(algorithm: f2l.algorithm, image: UIImage(data: data)!)
                        self.f2ls.append(step)
                    }
                }
            }
        }) { (error) in
            print(error?.localizedDescription)
        }
    }
    
    func getOLL() {
        Networking.getListOf(COLLECTION_NAME: "OLL", success: { (array: [OLL]) in
            for oll in array {
                let ref = Storage.storage().reference(withPath: oll.imagePath())
                ref.getData(maxSize: 4 * 1024 * 1024) { (data, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    
                    if let data = data {
                        let step = Step(algorithm: oll.algorithm ,image: UIImage(data: data)!)
                        self.olls.append(step)
                    }
                }
            }
        }) { error in
            print(error?.localizedDescription)
        }
    }
    
    func getPLL() {
        Networking.getListOf(COLLECTION_NAME: "PLL", success: { (array : [PLL]) in
            for pll in array {
                let ref = Storage.storage().reference(withPath: pll.imagePath())
                ref.getData(maxSize: 3 * 1024 * 1024) { (data, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    if let data = data {
                        let step = Step(name: pll.name,algorithm: pll.algorithm, image: UIImage(data: data)!)
                        self.plls.append(step)
                    }
                }
            }
        }) { (error) in
            print(error?.localizedDescription)
        }
    }
    
    func getCompetitions() {
        var results = [Competition]()
        DispatchQueue.main.async {
            guard let url = URL(string: "https://www.worldcubeassociation.org/api/v0/competitions") else {
                fatalError()
            }
            let session = URLSession.shared
            session.dataTask(with: url){ data, response, error in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let dictionaryArray = json as? [[String: Any]]{
                            
                            for competitionDictionary in dictionaryArray {
                                let competition = Competition(name: competitionDictionary["name"] as! String, date: competitionDictionary["start_date"] as! String, city: competitionDictionary["city"] as! String, url: competitionDictionary["url"] as! String)
                                results.append(competition)
                            }
                            self.competitons = results
                        }
                    }catch {
                        fatalError()
                    }
                }
            }.resume()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

