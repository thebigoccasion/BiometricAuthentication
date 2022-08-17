//
//  CredentialsLoginView.swift
//  BiometricLogin
//
//  Created by Anthony Beasley on 8/16/22.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Title()
            TextField("Username", text: $password)
                .cornerRadius(13)
            SecureField("Password", text: $username)
                .cornerRadius(13)
            
            PrimaryButton(showImage: false, text: "Login")
                .onTapGesture {
                    authenticationManager.authenticateWithCredentials(username: username, password: password)
                }
                .foregroundColor(.gray)
            Spacer()
                .frame(height: 100)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [ Color("LightBlue"), Color("LightGreen")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

/*
 
 */

struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticationManager())
    }
}
