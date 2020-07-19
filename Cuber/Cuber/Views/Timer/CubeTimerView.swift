//
//  CubeTimerView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/10/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import CoreData
import Firebase

struct CubeTimerView: View {
    
    @State var selectedView = "Timer"
    @State var cubeTimes = [CubeTime]()
    
    var body: some View {
        ZStack {
            VStack {
                if self.selectedView == "Timer" {
                    TimerView()
                }else {
                    StatsView(cubeTimes: self.cubeTimes)
                }
            }
            
            ZStack {
                 VStack{
                     Spacer()
                     HStack(spacing: 100){
                         TimerTabBarButton(selectedView: self.$selectedView, text: "المؤقت", name: "Timer", imageName: "stopwatch.fill")
                         
                         TimerTabBarButton(selectedView: self.$selectedView, text: "سجل الحل", name: "Stats", imageName: "chart.bar.fill")
                     }
                     .frame(width: 346, height: 66)
                     .background(Color(red: 121 / 255, green: 98 / 255, blue: 180 / 255).opacity(0.7))
                     .cornerRadius(40)
                 }
            }.padding([.bottom], 80)
        }
    }
    

}

struct CubeTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CubeTimerView()
    }
}
