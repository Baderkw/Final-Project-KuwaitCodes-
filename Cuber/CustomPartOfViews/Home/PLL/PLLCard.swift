//
//  PLLCard.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/15/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct PLLCard: View {
    
    var pll: Step
    
    var body: some View {
        ZStack{
            Color.white
            
            HStack{
                Image(uiImage: self.pll.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                VStack {
                    Text(self.pll.name!)
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                        .multilineTextAlignment(.center)
                    Spacer()
                    Text(self.pll.algorithm)
                        .font(.custom("Tajawal", size: 25))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding([.vertical], 10)
                Spacer()
            }.padding([.horizontal], 10)
            
        }
        .frame(width: 360, height: 120)
        .cornerRadius(19)
        .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
    }
}

struct PLLCard_Previews: PreviewProvider {
    static var previews: some View {
        PLLCard(pll: Step(name: "Ga",algorithm: "(R U’ R’ U’ R U R’) (U’ R U2 R’)", image: UIImage(named: "(R U’ R’ U’ R U R’) (U’ R U2 R’)")!))
    }
}
