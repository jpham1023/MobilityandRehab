//
//  userSettings.swift
//  MobilityandRehab
//
//  Created by Guest User on 5/30/24.
//what a noneducator user sees when signed in

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

@MainActor


class UserSettingsViewmodel: ObservableObject{
    func logOut() throws{
        try AuthenticationManager.authManager.signOut()
    }
        
        func resetPassword() async throws{
            let authUser = try? AuthenticationManager.authManager.getAuthenticatedUser()
            guard let email = authUser?.email else{return}
            try await AuthenticationManager.authManager.resetPassword(email:email)
        }
    }



struct userSettings: View{
    @StateObject var settingsViewmodel = UserSettingsViewmodel()
    @StateObject var adminViewmodel = UserViewmodel()
    @StateObject var signinviewmodel = signInViewmodel()
    @EnvironmentObject var appState: AppState
    @State var showAlert = false
    @State var showResetText = false
    @State var errorText = ""
    @State var showErrorAlert = false
    var body: some View{
        VStack{
            Spacer()
                .frame(height:75)
            Image(systemName: "figure.wave")
                .font(.system(size:60))
            Text("Welcome Back!")
                .font(.system(size:60))
                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
        }
        .padding()
        List(){
            Button(action: {
                Task{
                    do{
                       showAlert = true
                        
                    }
                    catch{
                        errorText = "Unable to log out"
                    }
                }
            }, label: {
                Text("Log out")
                    .foregroundStyle(.white)
                    .font(.system(size:30))
            })
            .frame(height:50)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Log out"),
                    message: Text("Are you sure you want to log out?"),
                    primaryButton: .default(
                        Text("Yes"),
                        action: {
                            Task{
                                do{
                                    try settingsViewmodel.logOut()
                                    print(signinviewmodel.email)
                                    appState.userIsSignedIn = false
                                    appState.educatorLogIn = false
                                }
                                catch{
                                    errorText = "unable to log out"
                                    showErrorAlert = true
                                }
                            }
                        }
                    ),
                    secondaryButton: .default(Text("No"))
                )}
            Button(action: {
                Task{
                    do{
                        try await settingsViewmodel.resetPassword()
                        showResetText = true
                    }
                    catch{
                        errorText = "Cannot reset Password try again"
                        showErrorAlert =  true
                    }
                }
            }, label: {
                Text("Reset Password")
                    .font(.system(size:30))
            })
            .frame(height:50)
            .alert(isPresented: $showResetText) {
                return  Alert(title:Text("Done!"), message: Text("Check email to reset your password"),dismissButton: .default(Text("Ok")))
            }
            
        }
        if showErrorAlert{
            Text(errorText)
        }
    }
    
    
}
