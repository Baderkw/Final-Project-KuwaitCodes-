//
//  MenuButton.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/8/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct MenuButton : View{

    var item: MenuItem
    @Binding var selectedView: String
    @Binding var menuIsShown: Bool 
    
    var body : some View {
        VStack {
            HStack {
                Button(action: {
                    print(self.item.arName)
                    
                    
                    withAnimation {
                        self.menuIsShown.toggle()
                        self.selectedView = self.item.name
                    }
                    
                }, label: {
                    
                    Text(self.item.arName)
                    .font(.custom("Tajawal-Medium", size: 23))
                    
                    Image(systemName: self.item.imageName)
                        .font(.system(size: 23))
                        .padding([.bottom], 10)
                    })
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.white)
                    
            }
                .padding([.trailing], 20)
                .frame(width: 290, height: 50, alignment: .trailing)
                .background(self.selectedView == item.name ? Color(red: 47 / 255, green: 48 / 255, blue: 140 / 255) : Color.clear)
                .cornerRadius(self.selectedView == item.name ? 30 : 0)
                
        }
    }
    
}

struct MenuButton_Previews: PreviewProvider {
    static var item = MenuItem(name: "Home", arName: "الصفحة الرئيسية", imageName: "house.fill")
    static var previews: some View {
        MenuButton(item: item, selectedView: .constant("Home"), menuIsShown: .constant(true))
    }
}
