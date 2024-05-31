//
//  userSettings.swift
//  MobilityandRehab
//
//  Created by Guest User on 5/30/24.
//

import SwiftUI
import FirebaseAuth
@MainActor
class UserSettingsViewmodel: ObservableObject{
    func logOut() throws{
        try AuthenticationManager.authManager.signOut()
        
        func resetPassword() async throws{
            let authUser = try? AuthenticationManager.authManager.getAuthenticatedUser()
            guard let email = authUser?.email else{return}
            try await AuthenticationManager.authManager.resetPassword(email:email)
        }
    }
    struct userSettings: View{
        @StateObject var settingsViewmodel = UserSettingsViewmodel()
        @Binding var showSignIn: Bool
        @State var showResetText = false
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
                Section(header:Text("Assignments")){
                }
            }
            List(){
                Section(header:Text("Settings")){
                    Button(action: {
                        Task{
                            do{
                                try settingsViewmodel.logOut()
                                showSignIn = true
                            }
                            catch{
                                Text("Unable to log out")
                            }
                        }
                    }, label: {
                        Text("Log Out")
                            .foregroundStyle(.white)
                    })
                    Button(action: {
                    //    settingsViewmodel.resetPassword()
                        showResetText = true
                    }, label: {
                        Text("Reset Password")
                            .foregroundStyle(.white)
                    })
                    .alert(isPresented: $showResetText) {
                        return  Alert(title:Text("Success"), message: Text("Check email to reset your password"),dismissButton: .default(Text("Ok")))
                    }
                }
            }
        }
    }
}
