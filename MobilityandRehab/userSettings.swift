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
    @State var showConfirmReset = false
    var body: some View{
        ScrollView{
            Spacer()
            VStack{
                Image(systemName: "person.circle.fill")
                    .font(.system(size:100))
                
                if(!userName.isEmpty){
                    Spacer()
                        .frame(height:5)
                    Text(userName)
                        .font(.system(size:25))
                        .bold()
                    Spacer()
                        .frame(height:20)
                }
                Text("Welcome back!")
                    .font(.system(size:45))
            }
            .padding()
            .onAppear(){
                Task{
                    await getUserName()
                }
            }
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
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:400, height:75)
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                    Text("Log out")
                        .foregroundStyle(.white)
                        .font(.system(size:30))
                        .bold()
                }
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
                                    errorText = error.localizedDescription
                                    showErrorAlert = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        showErrorAlert = false
                                }
                                }
                            }
                        }
                    ),
                    secondaryButton: .default(Text("No"))
                )}
            Spacer()
                .frame(height:35)
            Button(action: {
                Task{
                showResetText = true
                }
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:400, height:75)
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                    Text("Reset Password")
                        .font(.system(size:30))
                        .foregroundStyle(.white)
                        .bold()
                }
            })
            .frame(height:50)
            .alert(isPresented: $showResetText) {
                return  Alert(title:Text("Confirm"), message: Text("Are you sure you want to reset?"),  primaryButton: .default(
                    Text("Yes"),
                    action: {
                        Task{
                            do{
                                try await settingsViewmodel.resetPassword()
                                showConfirmReset = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    showConfirmReset = false
                            }
                            }
                            catch{
                                errorText = error.localizedDescription
                                showErrorAlert = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    showErrorAlert = false
                            }
                            }
                        }
                    }
                ),
                secondaryButton: .default(Text("No")))
            }
            Spacer()
                .frame(height:35)
            if showErrorAlert{
                Text("Error: \(errorText)")
            }
            if showConfirmReset{
                Text("Done! Check your email to reset password")
            }
        }
    }
    func getUserName() async {
        do{
            let authData = try  authManager.getAuthenticatedUser()
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
