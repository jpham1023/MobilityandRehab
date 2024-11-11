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
    @EnvironmentObject var viewobject: RehabViewmodel
    @StateObject var signinviewmodel = signInViewmodel()
    @State var userNavigate = false
    @State var errorText = ""
    @State var success = false
    var body: some View {
        NavigationStack{
        Image(systemName: "person.crop.circle")
            .font(.system(size:45))
        Text("Log In")
            .font(.system(size:45))
            VStack {
                TextField("Email", text: $signinviewmodel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $signinviewmodel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                if success{
                    Text("Success!")
                }
                Button(action: {
                    Task{
                        do{
                            try await signinviewmodel.signIn()
                            success = true
                            print("Sign in")
                        }
                        catch{
                            let error = error as NSError
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
                            print(error)
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
            }
            .padding()
        
            NavigationLink("", destination: UserPage(showSignIn: $success), isActive: $userNavigate)
        }
        .padding()
    }
    
    
}
