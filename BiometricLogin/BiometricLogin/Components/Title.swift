//
//  Title.swift
//  BiometricLogin
//
//  Created by Anthony Beasley on 8/11/22.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Quest")
            .bold()
            .font(.system(size: 60))
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
