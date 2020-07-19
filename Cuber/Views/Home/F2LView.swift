//
//  F2LView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/13/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct F2LView: View {
    
    @Binding var selectedView: String?
    @Binding var f2ls: [Step]
    @State var isOffline = false
    
    var body: some View {
        
        ZStack {
            Image("signBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //back button
                HStack {
                    Button(action: {
                        self.selectedView = nil
                    }, label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                    })
                    Spacer()
                }.padding()
                    .padding([.top], 30)
                
                //title
                VStack{
                    HStack{
                        Text("F2L")
                            .font(.custom("Tajawal", size: 50))
                        Spacer()
                    }
                    Spacer()
                }
                .padding([.leading], 40)
            }
            
            VStack {
                Spacer()
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 30) {
                        ForEach(self.f2ls, id: \.id) { f2l in
                                F2LCard(f2l: f2l)
                        }
                    }
                    .padding([.bottom], 80)
                }).frame(width:UIScreen.main.bounds.size.width ,height: UIScreen.main.bounds.size.height - 180)
                
            }
            
                if self.isOffline {
                    Text("من فضلك تأكد من اتصالك بالإنترنت.")
                }
        }
        .onAppear {
            if self.f2ls.isEmpty {
                self.isOffline = true
            }
        }
    }
}

struct F2LView_Previews: PreviewProvider {
    static var previews: some View {
        F2LView(selectedView: .constant(nil), f2ls: .constant([]))
    }
}
