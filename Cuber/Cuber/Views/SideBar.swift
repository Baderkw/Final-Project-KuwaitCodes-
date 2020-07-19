//
//  SideBar.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/7/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct SideBar: View {
    
    @Binding var selectedView: String
    @Binding var isShown: Bool
    @Binding var isSignedIn: Bool
    var items = Menuitems().items
    
    var body: some View {
        ZStack {
            
            Color(red: 155 / 255, green: 155 / 255, blue: 154 / 255)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    ForEach(items, id: \.id){ item in
                        MenuButton(item: item, selectedView: self.$selectedView, menuIsShown: self.$isShown)
                    }
                    .padding([.trailing], 5)
                    
                    SignOutButton(isSignedIn: self.$isSignedIn)
                        .padding([.top], 380)
                        .padding([.horizontal], 5)
                    Spacer()
                }
            }
            .padding([.top], 130)
            
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar(selectedView: .constant("Home"), isShown: .constant(true),isSignedIn: .constant(true))
    }
}
