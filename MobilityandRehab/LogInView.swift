//
//  LogIView.swift
//  MobilityandRehab
//
//  Created by Dylan Domeracki on 5/15/24.
//

import Foundation
import SwiftUI
import SwiftData
import FirebaseAuth

struct LogInView: View {
    @Environment(\.modelContext) var modelContext
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewobject: RehabViewmodel
    @StateObject var signinviewmodel = signInViewmodel()
    @State var userNavigate = false
    @State var errorText = ""
    
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
                Task{
                    do{
                        try await signinviewmodel.signIn()
                    }
                    catch{
                        var error = error as NSError
                        if let ErrorCode = AuthErrorCode.Code(rawValue: error.code){
                            switch ErrorCode{
                            case .invalidEmail:
                                errorText = "Enter a valid email address"
                            case .emailAlreadyInUse:
                                errorText = "This email is already connected to an existing user. Try logging in"
                            case .weakPassword:
                                errorText = "Password is too weak. Enter a new one."
                            case .networkError:
                                errorText = "Network error. Could not connect to database. Try again later"
                            case .tooManyRequests:
                                errorText = "Too many requests. Try again later"
                            case .internalError:
                                errorText = "An internal error has occured"
                            default:
                                errorText = "Sorry an unknown error has occured"
                            }
                    }
                        print(errorText)
                    }
                    
                }
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
