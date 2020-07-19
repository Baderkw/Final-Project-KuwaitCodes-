//
//  Menu.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/19/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

// Remember to add PureSwiftUI to your project for this to work https://github.com/CodeSlicing/pure-swift-ui
import PureSwiftUI

struct MenuView: View {
    
    @Binding var animate: Bool
    @State private var rotation: Double = 0
    @State private var trim: CGFloat = 0
    
    //    rgb(155, 155, 154)
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.clear)
            ZStack {
                
                Menu(animate: animate)
                    .stroke(Color(red: 155 / 255, green: 155 / 255, blue: 154 / 255), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(30)
            }
            .rotate(.degrees(rotation))
        }
        .frame(60)
        .onTapGesture {
            withAnimation(Animation.linear(duration: 0.5)) {
                if self.animate {
                    self.rotation = 0
                    self.trim = 0
                } else {
                    self.rotation = 180
                    self.trim = 1
                }
                self.animate.toggle()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(animate: .constant(false))
    }
}

struct Menu: Shape {
    private let layoutConfig = LayoutGuideConfig.grid(columns: 2, rows: 2)
    private var factor: Double
    
    init(animate: Bool = true) {
        self.factor = animate ? 1 : 0
    }
    
    var animatableData: Double {
        get { factor }
        set { factor = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        var g = layoutConfig.layout(in: rect)
        
        path.move(g[0, 0])
        path.line(g[2, 0].to(g[2, 2], factor))
        
        path.move(g[0, 1].to(g[1, 1], factor))
        path.line(g[2, 1].to(g[1, 1], factor))
        
        path.move(g[0, 2])
        path.line(g[2, 2].to(g[2, 0], factor))

        return path
    }
}
