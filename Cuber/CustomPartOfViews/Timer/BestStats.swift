//
//  BestStats.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/17/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct BestStats: View {
    
    var text: String
    @Binding var time: String
    
    var body: some View {
        VStack {
            Text(self.text)
                .font(.custom("Tajawal", size: 25))
                .padding([.bottom])
            
            Text(self.time)
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .padding(8)
                .padding([.vertical], 12)
                .background(Color.blue)
                .cornerRadius(100)
                .foregroundColor(.white)
        }.opacity(self.time.isEmpty ? 0 : 1)
    }
}

struct BestStats_Previews: PreviewProvider {
    static var previews: some View {
        BestStats(text: "Best of 5", time: .constant("12.5"))
    }
}
