//
//  HomeMove.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/8/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct HomeMove: View {
    
    var move : String
    
    var body: some View {
        VStack {
            Image(move)
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            
            Text(move)
                .font(.custom("Tajawal", size: 40))
        }
    }
}

struct HomeMove_Previews: PreviewProvider {
    
    static var move = "L'"
    
    static var previews: some View {
        HomeMove(move: move)
    }
}
