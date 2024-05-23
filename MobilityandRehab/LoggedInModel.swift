//
//  LoggedInModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/20/24.
//

import Foundation
import SwiftData

@Model
class userLogged{
    var loggedIn: Bool
    init(loggedIn:Bool){
        self.loggedIn = loggedIn
    }
    
    
}

