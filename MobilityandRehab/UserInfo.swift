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
    @Published var userInfo:[String:NSDictionary] = [:]
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
        var tempDict: [String: NSDictionary] = [:]
        let databaseref = Database.database().reference().child("Users")
        databaseref.getData{ myError, myDataSnapshot in
            for users in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
                var tempUserDict: [String:Bool] = [:]
                let username = users.key
                guard let userInfo = users.value as? [String: Bool] else {return}
                for videos in userInfo{
                    let video = videos.key
                    let watched = videos.value
                    let tempUserInfo = UserInfoModel(exercise: video,watched: watched)
                    tempUserDict[video] = watched
                }
                tempDict[username] = tempUserDict as NSDictionary
           }
            
            self.userInfo = tempDict
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
