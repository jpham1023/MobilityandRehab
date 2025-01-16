//
//  AuthenticationManager.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/28/24.
//firebase authentication manager for signign in users with an email and a password

import SwiftUI
import FirebaseAuth
import AuthenticationServices
import FirebaseCore

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

enum AuthState{
    case signedIn
    case signedOut
}
@MainActor
final class AuthenticationManager: ObservableObject{
    private var authStateHandle: AuthStateDidChangeListenerHandle!
    static let authManager = AuthenticationManager()
    @Published  var authState = AuthState.signedOut
    init(){
          configureAuthStateChanges()
      }
     func configureAuthStateChanges(){
       authStateHandle = Auth.auth().addStateDidChangeListener{ auth, user in
           print(user)
              self.updateUserState(user:user)
          }
      }
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user:user)
    }
    func updateUserState(user: User?){
         let user = user
          let isUserAuthenticated = user != nil
        authState = isUserAuthenticated ? .signedIn : .signedOut
      }
    
    func resetPassword(email:String) async throws{
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    func signIn(email:String, password:String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password:password)
        return AuthDataResultModel(user: authDataResult.user)
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

