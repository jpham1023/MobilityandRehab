//
//  SignInView.swift
//  MobilityandRehab
//
//  Created by Dylan Domeracki on 5/13/24.
//

import SwiftUI

struct User {
    var username: String
    var password: String
}

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: createAccount) {
                
                Text("Create Account")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Passwords do not match"), dismissButton: .default(Text("OK")))
        }
    }
    
    func createAccount() {
        if password != confirmPassword {
            showAlert = true
            return
        }
        
        
        let newUser = User(username: username, password: password)
        print("New User created: \(newUser)")
        NavigationLink("Log In", destination: LogInView())
    }
}
