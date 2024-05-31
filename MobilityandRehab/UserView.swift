//
//  UserView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/31/24.
//

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
    @StateObject var adminViewmodel = UserViewmodel()
    @State private var showSignIn:Bool = true
    @State private var educatorLogIn = false
    var body: some View{
            VStack{
                NavigationStack {
                    if showSignIn {
                        RootView()
                    } else if !educatorLogIn {
                        userSettings(showSignIn: $showSignIn)
                    } else {
                        UserPage(showSignIn: $showSignIn)
                    }
                }
            }
            .onAppear{
                if AuthenticationManager.authManager.authState == .signedOut{
                    showSignIn = true
                }
                else{
                    if let userEmail = Auth.auth().currentUser?.email{
                        if adminViewmodel.adminArray.contains(userEmail) {
                            educatorLogIn = true
                        }
                    }

                let authUser = try? AuthenticationManager.authManager.getAuthenticatedUser()
                    print(authUser)
                showSignIn = authUser == nil
            }
        }
    }
    
}
