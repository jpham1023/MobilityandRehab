//
//  AppState.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 12/19/24.
//

import Foundation

class AppState: ObservableObject{
    @Published var educatorLogIn: Bool {
            didSet {
                UserDefaults.standard.set(educatorLogIn, forKey: "educatorLogIn")
            }
        }
        @Published var userIsSignedIn: Bool {
            didSet {
                UserDefaults.standard.set(userIsSignedIn, forKey: "userIsSignedIn")
            }
        }
        
        init() {
            self.educatorLogIn = UserDefaults.standard.bool(forKey: "educatorLogIn")
            self.userIsSignedIn = UserDefaults.standard.bool(forKey: "userIsSignedIn")
        }
   
}
