//
//  AppState.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 12/19/24.
//

import Foundation

class AppState: ObservableObject{
    @Published var educatorLogIn: Bool = false
    @Published var userIsSignedIn: Bool = false
}
