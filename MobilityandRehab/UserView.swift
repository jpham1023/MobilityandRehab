//
//  UserView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/31/24.
//
//determines if we should navigate to educator or normal user page


import SwiftUI
import FirebaseAuth
import FirebaseDatabase

class UserViewmodel : ObservableObject{
    @Published var adminArray:[String] = []
    init(){
        pullAdminData()
    }
    func pullAdminData(){
        let databaseref = Database.database().reference().child("Admin")
        databaseref.getData{ myError, myDataSnapshot in
            for adminEmails in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
                guard let email = adminEmails.value as? String else{return}
                self.adminArray.append(email)
           }
        }
    }
}
struct UserView: View {
    @EnvironmentObject var appState:AppState
    @StateObject var adminViewmodel = UserViewmodel()
    @State private var educatorLogIn = false
    var body: some View{
        NavigationStack {
            if appState.userIsSignedIn {
                if appState.educatorLogIn {
                    UserPage()
                } else {
                    userSettings()
                }
            } else {
                RootView()
            }
        }
            .onAppear{
                if AuthenticationManager.authManager.authState == .signedOut{
                    appState.userIsSignedIn = false
                }
                else{
                    if let userEmail = Auth.auth().currentUser?.email{
                        if adminViewmodel.adminArray.contains(userEmail) {
                            appState.educatorLogIn = true
                        }
                    }

                let authUser = try? AuthenticationManager.authManager.getAuthenticatedUser()
                    appState.userIsSignedIn = !(authUser == nil)
            }
        }
    }
    
}
