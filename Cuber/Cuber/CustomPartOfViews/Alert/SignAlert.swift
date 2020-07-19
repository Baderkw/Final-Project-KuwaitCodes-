//
//  SignAlert.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/17/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct SignAlert: View {
    
    @Binding var isShown: Bool
    var imageName: String
    var message: String
    var buttonText: String
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                // Icon
                Image(self.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
                
                //Message
                Text(message)
                    .multilineTextAlignment(.trailing)
                    .padding([.horizontal], 5)
                    .font(.custom("Tajawal", size: 25))
                    .padding()
                    .foregroundColor(.black)
                
                
                // Dismiss button
                Button(action: {
                    withAnimation{
                        self.isShown = false
                    }
                    
                }, label: {
                    Text(self.buttonText)
                        .foregroundColor(.white)
                        .padding()
                        .padding([.horizontal], 80)
                        .background(Color(red: 67 / 255 , green: 182 / 255, blue: 3 / 255))
                        .cornerRadius(12)
                        .font(.custom("Tajawal", size: 26))
                        
                })
            }
        }
        
        .frame(width: 351, height: 313)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 3)
    }
}

struct SignAlert_Previews: PreviewProvider {
    static var previews: some View {
        SignAlert(isShown: .constant(true), imageName: "search", message: "قم بتوثيق حسابك عن طريق البريد الإلكتروني المرسل لك", buttonText: "حسناً")
    }
}
