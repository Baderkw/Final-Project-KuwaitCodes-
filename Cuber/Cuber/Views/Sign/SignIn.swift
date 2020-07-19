//
//  SignIn.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/12/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import Firebase

struct SignIn: View {
    
    @State var user = SignInCredentials(email: "", password: "")
    @Binding var isSignedIn: Bool
    @State var failedToSignIn = false
    @State var errorMessage = String()
    @State var errorImageName = String()
    var body: some View {
        
        ZStack(alignment: .center) {
            
            Image("signBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("cubeLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 189)
                    .padding([.vertical], 80)
                VStack {
                    VStack(spacing: 30) {
                        SigningTextField(data: self.$user.email, text: "البريد الإلكتروني", imageName: "Email Icon")
                        SigningSecureField(data: self.$user.password, text: "كلمة المرور",  imageName: "Password Icon")
                    }.padding([.bottom], 140)
                    
                    Button(action: {
                        self.signIn()
                    }, label: {
                        Text("تسجيل الدخول")
                            .frame(width: 300, height: 60)
                            .background(Color(red: 67 / 255, green: 182 / 255, blue: 3 / 255))
                            .foregroundColor(.white)
                            .font(.custom("Tajawal", size: 25))
                            .cornerRadius(13)
                            .shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)
                    })
                }.padding([.bottom], 50)
            }
                
            if self.failedToSignIn {
                SignAlert(isShown: self.$failedToSignIn, imageName: self.errorImageName, message: self.errorMessage, buttonText: "حسناً")
            }
            
        }
    }
    
    func signIn() {
        if self.user.email.isEmpty || self.user.password.isEmpty {
            
            self.errorMessage = "قم بتعبئة جميع الحقول"
            print(errorMessage)
            withAnimation {
                self.errorImageName = "error"
                self.failedToSignIn = true
            }
            
        }else {
            Networking.signIn(user: self.user, collectionName: "users", success: { (result) in
                print(result)
                
                guard let user = Auth.auth().currentUser else {
                    return
                }
                
                if !user.isEmailVerified {
                    self.errorMessage = "قم بتوثيق حسابك عن طريق البريد الإلكتروني المرسل لك."
                    withAnimation {
                        self.errorImageName = "search"
                        self.failedToSignIn = true
                    }
                    user.sendEmailVerification { (error) in
                        if error != nil {
                            print(error)
                            return
                        }
                    }
                    Networking.signOut()
                    
                }else {
                    withAnimation {
                        self.isSignedIn = true
                    }
                    
                }
                
            }) {
                print("error")
                self.errorMessage = "تأكد من صحة البيانات المدخلة."
                withAnimation {
                    self.errorImageName = "error"
                    self.failedToSignIn = true
                }
            }
        }
    }
    
}

//.shadow(color: Color(red: 182 / 255, green: 207 / 255, blue: 211 / 255), radius: 6, x: 3, y: 3)

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn(isSignedIn: .constant(false))
    }
}
