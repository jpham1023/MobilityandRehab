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
        Text("Assign youtube videos")
            .bold()
            .font(.system(size:37))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
            .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)

        List{
            ForEach(userDict.keys.sorted(), id: \.self){ user in
                HStack{
                    Image(systemName: "person.circle.fill")
                        .font(.system(size:75))
                    Text(user)
                        .font(.system(size:75))
                        .foregroundStyle(.black)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                        .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                        .frame(height:130)
                   
                    
                }
                
                
            }
        }
    }
}
