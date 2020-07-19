//
//  SigningTextField.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/12/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct SigningTextField: View {
    
    @Binding var data: String
    var text: String
    var imageName: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Spacer()
                        Text(self.text)
                            .font(.system(size: 15))
                            .foregroundColor(self.$data.wrappedValue.isEmpty ? Color(.placeholderText) : .gray)
                            .opacity(self.$data.wrappedValue.isEmpty ? 0 : 1)
                            .offset(y: self.$data.wrappedValue.isEmpty ? 30 : 10)
                            .scaleEffect(self.$data.wrappedValue.isEmpty ? 1 : 0.75, anchor: .trailing)
                    }.padding(-14)
                    
                    TextField(self.text, text: self.$data)
                        .multilineTextAlignment(.trailing)
                        .font(.custom("Tajawal", size: 25))
                        .keyboardType(self.imageName == "Email Icon" ? .emailAddress : .default)
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.3))
                    Image(self.imageName)
            }
            .background(Color.white)
            .frame(width: 350, height: 60)
            .cornerRadius(20)
            .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
            
        }
    }
}

struct SigningSecureField: View {
    
    @Binding var data: String
    var text: String
    var imageName: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Spacer()
                        Text(self.text)
                            .font(.system(size: 15))
                            .foregroundColor(self.$data.wrappedValue.isEmpty ? Color(.placeholderText) : .gray)
                            .opacity(self.$data.wrappedValue.isEmpty ? 0 : 1)
                            .offset(y: self.$data.wrappedValue.isEmpty ? 30 : 10)
                            .scaleEffect(self.$data.wrappedValue.isEmpty ? 1 : 0.75, anchor: .trailing)
                    }.padding(-14)

                    SecureField(self.text, text: self.$data)
                        .multilineTextAlignment(.trailing)
                        .font(.custom("Tajawal", size: 25))
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.3))
                Image(self.imageName)
            }
            .background(Color.white)
            .frame(width: 350, height: 60)
            .cornerRadius(20)
            .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
            
        }
    }
}

struct SigningTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SigningTextField(data: .constant(""), text: "البريد الإلكتروني",  imageName: "Email Icon")
            SigningSecureField(data: .constant(""), text: "كلمة المرور",  imageName: "Password Icon")
        }
        
    }
}
