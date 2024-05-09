//
//  LogIView.swift
//  MobilityandRehab
//
//  Created by Dylan Domeracki on 5/15/24.
//

import Foundation
import SwiftUI

struct LogInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: signIn) {
                Text("Sign In")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
    
    func signIn() {
        
    }
}
