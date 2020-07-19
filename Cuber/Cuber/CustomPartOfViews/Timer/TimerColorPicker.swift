//
//  TimerColorPicker.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/9/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct TimerSettingsColorPicker: View {
    
    @Binding var selectedColor: UIColor
    var colors = [
        UIColor(red: 172 / 255, green: 61 / 255, blue: 91 / 255, alpha: 1),
        UIColor(red: 115 / 255, green: 80 / 255, blue: 209 / 255, alpha: 1),
        UIColor(red: 61 / 255, green: 129 / 255, blue: 47 / 255, alpha: 1),
        UIColor(red: 238 / 255, green: 238 / 255, blue: 178 / 255, alpha: 1),
        UIColor.black
    ]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(colors, id: \.self) { color in
                ColorSquare(color: color, selectedColor: self.$selectedColor)
            }
        }
    }
}

/*Colors :
 pink : Color(red: 172 / 255, green: 61 / 255, blue: 91 / 255)
 blue : Color(red: 115 / 255, green: 80 / 255, blue: 209 / 255)
 green :Color(red: 61 / 255, green: 129 / 255, blue: 47 / 255)
 yellow:Color(red: 238 / 255, green: 238 / 255, blue: 178 / 255)
 black : Color.black
 
 */

struct ColorSquare: View {
    
    var color: UIColor
    @Binding var selectedColor: UIColor
    
    var body: some View {
        Button(action: {
            print("tapped")
            self.selectedColor = self.color
        }, label: {
            Color(self.color)
        })
        .buttonStyle(PlainButtonStyle())
        .frame(width: 40, height: 40)
        .cornerRadius(7)
        
    }
}

struct TimerColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        TimerSettingsColorPicker(selectedColor: .constant(UIColor.black))
    }
}
