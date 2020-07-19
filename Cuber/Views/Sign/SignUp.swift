//
//  SignUp.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/12/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import Firebase

struct SignUp: View {
    
    @State var user = CubeUser()
    @State var pass = String()
    @State var rePass = String()
    @Binding var chosenView: String?
    @State var failedToSignUp = false
    @State var errorImageName = String()
    @State var errorMessage = String()
    
    var body: some View {
        ZStack {
            
            Image("signBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("cubeLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 189)
                    .padding([.vertical], 30)
                VStack(spacing: 30) {
                    SigningTextField(data: self.$user.name, text: "الاسم", imageName: "Person Icon")
                    SigningTextField(data: self.$user.email, text: "البريد الإلكتروني", imageName: "Email Icon")
                    SigningSecureField(data: self.$pass, text: "كلمة المرور",  imageName: "Password Icon")
                    SigningSecureField(data: self.$rePass, text: "إعادة كلمة المرور",  imageName: "Password Icon")
                }
                
                Button(action: {
                    self.signUp()
                }, label: {
                    Text("تسجيل الحساب")
                        .frame(width: 300, height: 60)
                        .background(Color(red: 47 / 255, green: 48 / 255, blue: 140 / 255))
                        .foregroundColor(.white)
                        .font(.custom("Tajawal", size: 25))
                        .cornerRadius(13)
                        .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
                }).padding([.vertical], 140)
                
            }
            
            if self.failedToSignUp {
                SignAlert(isShown: self.$failedToSignUp, imageName: self.errorImageName, message: self.errorMessage, buttonText: "حسناً")
            }
        }
    }
    
    func signUp() {
        
        if self.user.name == "" || self.user.email == "" || self.pass == ""
            || self.rePass == "" {
            withAnimation {
                self.errorMessage = "قم بتعبئة جميع الحقول"
                self.errorImageName = "error"
                self.failedToSignUp = true
            }
        }else if self.pass != self.rePass {
            print("Please check the passwords")
            withAnimation {
                self.errorMessage = "تأكد من صحة البيانات المدخلة."
                self.errorImageName = "error"
                self.failedToSignUp = true
            }
        }else {
            Networking.signUp(user: self.user, password: self.pass, success: { (result) in
                print(result)
                self.chosenView = nil
            }) {
                withAnimation {
                    self.errorMessage = "تأكد من صحة البيانات المدخلة."
                    self.errorImageName = "error"
                    self.failedToSignUp = true
                }
            }
            
            
        }
    }
    
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(chosenView: .constant("Sign up"))
    }
}
