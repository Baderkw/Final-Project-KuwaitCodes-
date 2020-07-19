//
//  TimerTabBarButton.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/10/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct TimerTabBarButton: View {
    
    @Binding var selectedView: String
    var text: String
    var name: String
    var imageName: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.selectedView = self.name
            }
            
        }, label: {
            HStack {
                if self.selectedView == self.name {
                    Text(text)
                        
                }
                Image(systemName: self.imageName)
            }
        }).buttonStyle(PlainButtonStyle())
            .foregroundColor(self.selectedView == self.name ? .white : .black)
    }
}

struct TimerTabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerTabBarButton(selectedView: .constant("Timer"), text: "المؤقت", name: "Timer", imageName: "stopwatch.fill")
    }
}
