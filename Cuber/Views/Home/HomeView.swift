//
//  HomeView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/8/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    var items = HomeItems().items
    @Binding var view: String? 
    var moves = [
        ["R", "R'"],
        ["L", "L'"],
        ["U", "U'"],
        ["D", "D'"],
        ["F", "F'"],
        ["B", "B'"]
    ]
    
    var body: some View {
        
        ZStack {
            VStack {
                Image("cubeLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .padding([.top], 80)
                Spacer()
            }
            
            VStack(alignment: .center,spacing: 10) {
                
                
                VStack {
                    ForEach(items ,id: \.id) { item in
                        HomeButton(item: item,selectedView: self.$view)
                            .padding(10)
                    }
                }.padding([.top], 80)
                
                
                HStack {
                    ScrollView(.horizontal ,showsIndicators: false) {
                        
                        HStack {
                            ForEach(moves , id: \.self){ move in
                                HStack(alignment: .center) {
                                    
                                    Spacer()
                                    HomeMove(move: move[0])
                                    Spacer()
                                    Divider()
                                    HomeMove(move: move[1])
                                    Spacer()
                                    
                                }
                                .frame(width: 350, height: 200, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                            }
                            
                            
                        }
                        
                    }
                    .padding([.top], 20)
                    
                }
            }
            .padding([.top], 150)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home(view: .constant(nil ))
    }
}
