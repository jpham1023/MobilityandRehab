//
//  LoggedInModel.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 11/21/24.
//

import Foundation
import SwiftData

@Model
class userLogged{
    var loggedIn:Bool
    init(loggedIn:Bool){
        self.loggedIn = loggedIn
    }
}
