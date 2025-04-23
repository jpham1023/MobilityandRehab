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
    @EnvironmentObject var authManager: AuthenticationManager
    @EnvironmentObject var appState: AppState
    @State var showAlert = false
    @State var showResetText = false
    @State var errorText = ""
    @State var showErrorAlert = false
    @State var userName:String = ""
    var body: some View{
        VStack{
            Spacer()
                .frame(height:25)
            Image(systemName: "person.circle.fill")
                .font(.system(size:100))
        
            if(!userName.isEmpty){
                Spacer()
                    .frame(height:10)
                Text(userName)
                    .font(.system(size:20))
                Spacer()
                    .frame(height:17)
        }
                Text("Welcome back!")
                    .font(.system(size:55))
                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
        }
        .padding()
        .onAppear(){
            Task{
                await getUserName()
            }
        }
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
    func getUserName() async {
        do{
            let authData = try await authManager.getAuthenticatedUser()
            let userEmail = authData.email
            if let atRange = userEmail.range(of:"@"){
                let name = userEmail[..<atRange.lowerBound]
                userName = String(name)
                print(userName)
            }
        }
        catch{
            print("Error handling mark as done: \(error)")
        }
    }
    
    
}
