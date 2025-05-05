//
//  StudentAssignmentView.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 4/25/25.
//
import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct StudentAssignmentView: View {
    var username:String
    @EnvironmentObject var userInfoObject: UserInfoViewmodel
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View {
        let userDict = userInfoObject.userInfo
        List{
            ForEach(userDict.keys.sorted(), id:\.self){user in
                if let data = userDict[user] as? [String:Any]{
                    if user == username{
                        ForEach(data.keys.sorted(), id:\.self){exercise in
                            if(data[exercise] == true){
                                Text(exercise)
                            }
                        }
                    }
                }
            }
        }
        HStack{
            Text("GHi")
        }

    }
        

}

