//
//  StudentAssignmentView.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 4/25/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct StudentAssignmentView: View {
    var username:String
    @EnvironmentObject var userInfoObject: UserInfoViewmodel
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View {
        let userDict = userInfoObject.userInfo
        ForEach(userDict.keys.sorted(), id: \.self){ user in
            if( user == username){
                let data = userDict[user]
               // print(data)
            }
        }
    }
}

