//
//  UserInfo.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 2/18/25.
//

import Foundation
import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

class UserMessage: ObservableObject{
    @Published var userMessage:[String:NSDictionary] = [:]
    init(){
        pullUserData()
    }
    
    func addUserToFirebase(currentUser:String, message: String, exercise:String){
        let databaseref = Database.database().reference()
        let dict = [exercise: message] as [String: String]
        databaseref.child("UserMessages").child(currentUser as String).updateChildValues(dict)
        pullUserData()
    }
    
    func removeMessage(key: String, currentUser:String){
            let databaseref = Database.database().reference()
            databaseref.child("UserMessages").child(currentUser as String).child(key).removeValue()
          pullUserData()
        }
        

    
    func pullUserData(){
        var tempDict: [String: NSDictionary] = [:]
        let databaseref = Database.database().reference().child("UserMessages")
        databaseref.getData{ myError, myDataSnapshot in
            for users in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
                var tempUserDict: [String:String] = [:]
                let username = users.key
                guard let userInfo = users.value as? [String: String] else {return}
                print(userInfo)
                for messages in userInfo{
                    let message = messages.value
                    let exercise = messages.key
                    tempUserDict[exercise] = message
                }
                tempDict[username] = tempUserDict as NSDictionary
           }
            
            self.userMessage = tempDict
        }
    }
    
}




