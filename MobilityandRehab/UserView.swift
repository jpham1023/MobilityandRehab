//
//  UserView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/31/24.
//

import SwiftUI
import FirebaseAuth

class UserViewmodel : ObservableObject{
    @Published var adminArray:[String] = []
    init(){
        pullAdminData()
    }
    func pullAdminData(){
        let databaseref = Database.database().reference.child("Admin")
        databaseref.getData{ myError, myDataSnapshot in
            for adminEmails in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
                guard let email = adminEmails.value as? String else{return}
                adminArray.append(email)
           }
        }
    }
}
struct UserView: View{
    @StateObject var adminViewmodel = UserViewmodel()
    @State private var showSignIn = false
    @State private var educatorLogIn = false
    var body: some View{
          let authUser = try? AuthenticationManager.manager.getAuthenticatedUser()
      self.showSignIn = authUser == nil
    if authManager.authState != .signedOut{
            showSignIn = true
        if adminViewmodel.adminArray.contains(authManager.user?.email) {
                educatorLogIn = true
     
        }
        NavigationStack{
            if showSignIn == true{
                RootView()
            }
            if showSignIn == false && educatorLogIn == false{
                userSettings(showSignIn: $showSignIn)}
        }
        if showSignIn == false && educatorLogIn == true{
            UserPage(showSignIn:$showSignIn)
        }
    }
}


