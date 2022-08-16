//
//  LoginView.swift
//  BiometricLogin
//
//  Created by Anthony Beasley on 8/11/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    var body: some View {
        VStack(spacing: 40) {
            Title()
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
            
            switch authenticationManager.biometryType {
            case .faceID:
                PrimaryButton(image: "faceid", text: "Login with FaceID")
            case .touchID:
                PrimaryButton(image: "touchid", text: "Login with TouchID")
            default:
                PrimaryButton(image: "person.fill", text: "Login with Credentials")
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [ Color("LightBlue"), Color("LightGreen")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationManager())
    }
}
/*
 LinearGradient(colors: [ Color("LightBlue"), Color("LightGreen")], startPoint: .topLeading, endPoint: .bottomTrailing)
 
 LinearGradient(colors: [.white, Color("LightBlue"), Color("LightBlue"), Color("LightBlue"), Color("LightBlue"), Color("LightBlue"), Color("LightBlue"), Color("LightBlue"), Color("LightBlue"), Color("LightGreen"), Color("LightGreen")], startPoint: .topLeading, endPoint: .bottomTrailing)
 
 Color("LightBlue")
 */

