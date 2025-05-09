//
//  AssignStudents.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 4/25/25.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseDatabase


struct AssignStudents: View{
    @EnvironmentObject var userInfoObject: UserInfoViewmodel
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View{
        let userDict = userInfoObject.userInfo
        //["asleep": ["Ankle Mobility": true], "qpham6326": ["Back and spine mobility": false, "Hip Flow Routine": true]]
        Spacer()
        Text("View Student Progress")
            .bold()
            .font(.system(size:45))

        List{
            ForEach(userDict.keys.sorted(), id: \.self){ user in
                NavigationLink(destination: StudentAssignmentView(username:user)){
                    HStack{
                        Image(systemName: "person.circle.fill")
                            .font(.system(size:75))
                        Text(user)
                            .font(.system(size:75))
                            .frame(height:130)
                        
                        
                    }
                }
                
            }
        }
        .frame(width:900)
    }
}
