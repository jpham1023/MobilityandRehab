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
    @EnvironmentObject var appState: AppState
    @StateObject var signinviewmodel = signInViewmodel()
    @State var userNavigate = false
    @State var errorText = ""
    @State var success = false
    @StateObject var adminViewmodel = UserViewmodel()
    @State var errorTextAlert = false
    @State var showEmailError = false
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
                    if !signinviewmodel.email.contains("@") || !signinviewmodel.email.contains("."){
                        showEmailError = true
                    }
                    else{
                        Task{
                            do{
                                print(signinviewmodel.email)
                                try await signinviewmodel.signIn()
                                success = true
                                appState.userIsSignedIn = true
                                if let userEmail = Auth.auth().currentUser?.email{
                                    if adminViewmodel.adminArray.contains(userEmail) {
                                        appState.educatorLogIn = true
                                    }
                                }
                                print(signinviewmodel.email)
                            }
                            catch{
                                let error = error as NSError
                                handleAuthError(error: error)
                            }
                            
                        }
                    }
                }) {
                    Text("Sign In")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                        .cornerRadius(8)
                }
                if errorTextAlert{
                    Text(errorText)
                }
                if showEmailError == true{
                    Text("Enter a valid email")
                        .foregroundStyle(Color.red)
                }
            }
            .padding()
        
        }
        .padding()
    }
    func handleAuthError(error:NSError){
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
            errorTextAlert = true
            print(errorText)
        }
        
    }
}
