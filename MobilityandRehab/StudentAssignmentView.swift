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
        ForEach(Array(arrayLiteral: userDict.keys.sorted()), id: \.self) { user in
            if user as! String == username {
                if let data = userDict[user.description] as? NSDictionary {
                            ForEach(data.allKeys.sorted(), id: \.self) { exercise in
                                Text(exercise as? String ?? "Unknown Exercise")
                            }
                        }
                    }
                }

    }
}

