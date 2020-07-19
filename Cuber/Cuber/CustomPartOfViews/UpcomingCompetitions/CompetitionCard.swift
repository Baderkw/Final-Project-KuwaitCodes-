//
//  CompetitionCard.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/11/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct CompetitionCard: View {
    
    var competition: Competition
    
    var body: some View {
        ZStack {
            
            VStack {
                Image(uiImage: competition.image ?? UIImage(named: "wca")!)
                    .resizable()
                    .frame(width: 382, height: 400)
                    .scaledToFill()
                    .cornerRadius(20)
            }
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    
                    Text(competition.name)
                               .font(.custom("Tajawal", size: 28))
                               .lineLimit(1)
                        .padding([.horizontal], 10)
                           
                           VStack(spacing: 10) {
                               
                               HStack {
                                   Spacer()
                                Text(competition.city)
                                   Text("المدينة : ")
                               }.font(.custom("Tajawal", size: 18))
                               HStack {
                                   
                                   Button(action: {
                                    UIApplication.shared.open(URL(string: self.competition.url)!)
                                   }, label: {
                                       Text("المزيد من المعلومات")
                                           .font(.custom("Tajawal", size: 16))
                                   }).padding([.leading])
                                   
                                   Spacer()
                                   HStack {
                                    Text(competition.date)
                                       Text("تاريخ المسابقة : ")
                                   }.font(.custom("Tajawal", size: 16))
                                   
                
                               }
                           }.padding([.trailing], 20)
                           
                           
                       }.frame(width: 382, height: 121)
                           .background(Color.white)
                    .cornerRadius(20)
            }
                       
                        
        }
        .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
    }
}

struct CompetitionCard_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionCard(competition: Competition(name: "Kuwait", date: "20-11-2020", city: "Kuwait", url: "www.sfg.com"))
    }
}
