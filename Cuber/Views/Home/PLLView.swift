//
//  PLLView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/14/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct PLLView: View {
    @Binding var selectedView: String?
    @Binding var plls: [Step]
    @EnvironmentObject var youtubeEnv: YouTubeControlState
    @State var videoIsShown = false
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
                
                
                VStack{
                    //title
                    HStack{
                        Text("PLL")
                            .font(.custom("Tajawal", size: 50))
                        Spacer()
                    }.padding([.leading], 40)
                    
                    VStack {
                        if self.videoIsShown {
                            ZStack{
                                HStack {
                                    Spacer()
                                    YouTubeView(playerState: youtubeEnv)
                                        .onAppear(perform: getVideo)
                                    
                                    Spacer()
                                }
                                HStack {
                                    if self.youtubeEnv.videoState == .pause {
                                        Spacer()
                                        Button(action: {
                                            self.youtubeEnv.backward()
                                        }, label: {
                                            Image(systemName: "gobackward.10")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        })
                                        Spacer()
                                        Spacer()
                                        Button(action: {
                                            self.youtubeEnv.forward()
                                        }, label: {
                                            Image(systemName: "goforward.10")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        })
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                    }
                }
                
                Button(action: {
                    withAnimation {
                        self.videoIsShown.toggle()
                    }
                }, label: {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(self.videoIsShown ? 90 : -90))
                    
                }).buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 30) {
                        ForEach(self.plls, id: \.id) { pll in
                            PLLCard(pll: pll)
                        }
                    }
                    .padding([.bottom], 80)
                }).frame(width:UIScreen.main.bounds.size.width)
            }
            
            if self.isOffline {
                Text("من فضلك تأكد من اتصالك بالإنترنت.")
            }
        }
        .onAppear {
            if self.plls.isEmpty {
                self.isOffline = true
            }
        }
    }
    
    func getVideo() {
        youtubeEnv.videoID = "HWIQdX8vHcE"
    }
}

struct PLLView_Previews: PreviewProvider {
    static var previews: some View {
        PLLView(selectedView: .constant(nil), plls: .constant([]))
    }
}
