//
//  HomeButton.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/8/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct HomeButton: View {
    
    var item : HomeItem
    var isShownView = false
    @Binding var selectedView: String?
    
    var body: some View {
        Button(action: {
            print("Tapped \(self.item.text)")
            self.selectedView = self.item.name
        }, label: {
            ZStack {
                Color(red: item.backColor.red, green: item.backColor.green, blue: item.backColor.blue)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 2, x: 2, y: 2)
                Text(item.text)
                    .foregroundColor(item.text == "OLL Algorithms" ? .gray : .white)
                    .font(.custom("Tajawal", size: 24))
                    .padding([.top], 7)
            }
        })
            .buttonStyle(PlainButtonStyle())
            .frame(width: 300, height: 60)
    }
}

struct HomeButton_Previews: PreviewProvider {
    
    static var item = HomeItems().items[0]
    
    static var previews: some View {
        HomeButton(item: item, selectedView: .constant(nil))
    }
}
