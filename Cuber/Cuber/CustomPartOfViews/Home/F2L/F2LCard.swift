//
//  F2LCard.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/14/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import Firebase

struct F2LCard: View {
    
    var f2l: Step
    
    var body: some View {
        ZStack{
            Color.white
            
            HStack{
                Image(uiImage: self.f2l.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                Text(self.f2l.algorithm)
                    .font(.custom("Tajawal", size: 25))
                    .multilineTextAlignment(.center)
                Spacer()
            }.padding([.horizontal], 10)
        }
        .frame(width: 360, height: 105)
        .cornerRadius(19)
        .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
        .onTapGesture {
            print(self.f2l.algorithm)
        }
    }
    
}

struct F2LCard_Previews: PreviewProvider {
    static var previews: some View {
        F2LCard(f2l: Step(algorithm: "R U R'", image: UIImage(systemName: "person")!))
    }
}
