//
//  OLLCard.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/15/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import youtube_ios_player_helper
import AVFoundation
import UIKit

struct OLLCard: View {
    
    @State var isTapped = false
    var oll: Step
    @State var url = "https://www.youtube.com/watch?v=47JfJxU7EjM"
    @State var youtubeController = YouTubeControlState()
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                ZStack{
                    
                    VStack{
                        HStack {
                            Image(uiImage: oll.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                            Spacer()
                            Text(oll.algorithm)
                                .font(.custom("Tajawal", size: 25))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }.padding([.horizontal], 10)


                    }
                }
                
            }
        }
        .frame(width: 362, height: self.isTapped ? 326 : 112)
        .cornerRadius(20)
        .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
    }
    
}

struct OLLCard_Previews: PreviewProvider {
    static var previews: some View {
        OLLCard(oll: Step(algorithm: "R U R'", image: UIImage(named: "(R U’ R’ U’ R U R’) (U’ R U2 R’)")!))
    }
}


