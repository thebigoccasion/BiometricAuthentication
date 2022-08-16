//
//  ContentView.swift
//  BiometricLogin
//
//  Created by Anthony Beasley on 8/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManger = AuthenticationManager()
    
    
    var body: some View {
        VStack {
            LoginView()
                .environmentObject(authenticationManger)
        }
        .alert(isPresented: $authenticationManger.showAlert) {
            Alert(title: Text("Error"), message: Text(authenticationManger.errorDescription ?? "Error trying to login with credentials, please try again."), dismissButton: .default(Text("Ok")))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(LinearGradient(colors: [Color("LightBlue"), Color("LightGreen")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
