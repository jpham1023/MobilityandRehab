//
//  AuthenticationManager.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/28/24.
//

import SwiftUI
import FirebaseAuth

struct AuthDataResultModel{
    let uid: String
    let email:String
    let photoUrl: String?
    init(user: FirebaseAuth.User){
        self.uid = user.uid
        self.email = user.email ?? ""
      self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager{
    static let authManager = AuthenticationManager()
    init(){ }
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user:user)
    }
    func createUser(email:String, password:String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
       let result =  AuthDataResultModel(user: authDataResult.user)
        return result
    }
    func signOut() throws{
    try Auth.auth().signOut()
    }
}

