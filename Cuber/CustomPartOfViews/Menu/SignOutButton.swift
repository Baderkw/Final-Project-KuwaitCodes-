//
//  SignOutButton.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/14/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct SignOutButton: View {
    
    @Binding var isSignedIn: Bool
    
    var body: some View {
        Button(action: {
            print("signed out")
            Networking.signOut()
            withAnimation{
                self.isSignedIn = false
            }
        }, label: {
            Text("Sign out")
                .padding([.top], 5)
                .font(.custom("Tajawal-Medium", size: 23))
                .frame(width: 245, height: 50)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(30)
        })
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton(isSignedIn: .constant(true))
    }
}
