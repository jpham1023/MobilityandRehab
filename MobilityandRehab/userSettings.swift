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
    @EnvironmentObject var appState: AppState
    @State var showAlert = false
    @State var showResetText = false
    @State var errorText = ""
    @State var showErrorAlert = false
    var body: some View{
        VStack{
            Image(systemName: "figure.wave")
                .font(.system(size:60))
            Text("Welcome Back!")
                .font(.system(size:60))
                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                .shadow(color: .black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                .shadow(color: .white.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
        }
        .padding()
        List(){
            Button(action: {
                Task{
                    do{
                        try settingsViewmodel.logOut()
                        appState.userIsSignedIn = false
                        
                    }
                    catch{
                        errorText = "Unable to log out"
                    }
                }
            }, label: {
                Text("Log Out")
                    .foregroundStyle(.white)
            })
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
                    }
                    catch{
                        errorText = "Cannot reset Password try again"
                        showErrorAlert =  true
                    }
                }
            }, label: {
                Text("Reset Password")
            })
            
            .alert(isPresented: $showResetText) {
                return  Alert(title:Text("Success"), message: Text("Check email to reset your password"),dismissButton: .default(Text("Ok")))
            }
        }
        .alert(isPresented: $showErrorAlert){
            return Alert(title:Text("Error"), message: Text(errorText), dismissButton: .default(Text("Ok")))
        }
    }
    
    
}
