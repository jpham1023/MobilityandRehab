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

class UserInfoViewmodel: ObservableObject{
    @Published var userInfo:[UserInfoModel] = []
    init(){
        pullUserData()
    }
    
    func addUserToFirebase(currentUser:String, userData: UserInfoModel){
        let databaseref = Database.database().reference()
        let exerciseName = userData.exercise as String
        let watched = userData.watched as Bool
        let userInfo:[String:Bool] = [exerciseName: watched]
        databaseref.child("Users").child(currentUser as String).updateChildValues(userInfo)
    }
    
    
    func pullUserData(){
        let databaseref = Database.database().reference().child("Users")
        databaseref.getData{ myError, myDataSnapshot in
            for users in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
           
           }
        }
    }
    
}



class UserInfoModel{
    init(exercise: String, watched: Bool){
        self.exercise = exercise
        self.watched = watched
    }
    var exercise:String
    var watched: Bool
}
