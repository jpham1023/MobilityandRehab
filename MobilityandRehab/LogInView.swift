//
//  LogIView.swift
//  MobilityandRehab
//
//  Created by Dylan Domeracki on 5/15/24.
//

import Foundation
import SwiftUI
import SwiftData

struct LogInView: View {
    @Environment(\.modelContext) var modelContext
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewobject: RehabViewmodel
    @State var userNavigate = false
    
    var body: some View {
        Image(systemName: "person.crop.circle")
            .font(.system(size:45))
        Text("Log In")
            .font(.system(size:45))
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                let newUser = userLogged(loggedIn: true)
                modelContext.insert(newUser)
                if username == "Educator@stu.d214.org"{
                    viewobject.educatorLogged = true
                    print("logged in")
                }
                userNavigate = true
            }) {
                Text("Sign In")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                    .cornerRadius(8)
            }
            .padding()
            NavigationLink("", destination: UserPage(), isActive: $userNavigate)
        }
        .padding()
    }
    
    
}
