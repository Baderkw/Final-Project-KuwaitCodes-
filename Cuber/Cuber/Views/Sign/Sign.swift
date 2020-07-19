//
//  Sign.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/12/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct Sign: View {
    
    @State var chosenView: String? = nil
    @Binding var isSignedIn: Bool
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Image("signBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                NavigationLink(destination: SignIn(isSignedIn: self.$isSignedIn), tag: "Sign in", selection: self.$chosenView) {
                    Text("")
                }
                
                NavigationLink(destination: SignUp(chosenView: self.$chosenView), tag: "Sign up", selection: self.$chosenView) {
                    Text("")
                }
                
                
                VStack(spacing: 100) {
                    
                    Image("cubeLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    VStack(spacing: 30) {
                        
                        Button(action: {
                            self.chosenView = "Sign in"
                        }, label: {
                            Text("تسجيل الدخول")
                                .frame(width: 300, height: 60)
                                .background(Color(red: 67 / 255, green: 182 / 255, blue: 3 / 255))
                                .foregroundColor(.white)
                                .font(.custom("Tajawal", size: 25))
                                .cornerRadius(13)
                                .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
                        })
                        
                        Button(action: {
                            self.chosenView = "Sign up"
                        }, label: {
                            Text("تسجيل الحساب")
                                .frame(width: 300, height: 60)
                                .background(Color(red: 47 / 255, green: 48 / 255, blue: 140 / 255))
                                .foregroundColor(.white)
                                .font(.custom("Tajawal", size: 25))
                                .cornerRadius(13)
                                .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
                        })
                    }
                }
            }
            
        .navigationBarTitle("  ")
        }
    }
}

struct Sign_Previews: PreviewProvider {
    static var previews: some View {
        Sign(isSignedIn: .constant(false))
    }
}
