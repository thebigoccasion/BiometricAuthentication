//
//  AuthenticationManager.swift
//  BiometricLogin
//
//  Created by Anthony Beasley on 8/11/22.
//

import Foundation
import LocalAuthentication


class AuthenticationManager: ObservableObject {
    private(set) var context = LAContext()
    @Published private(set) var biometryType: LABiometryType = .none
    private(set) var canEvaluatePolicy = false
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    func authenticateWithBioMetrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let reason = "Log into your account"
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                        self.biometryType = .none
                }
            }
        }
    }
    
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    init() {
        getBiometryType()
    }
}
