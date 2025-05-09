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
        Spacer()
        Text(username)
            .bold()
            .font(.system(size: 50))
        List{
            HStack{
                Text("Exercises")
                    .font(.system(size: 35))
                Spacer()
                Text("Watched")
                    .font(.system(size: 35))
            }
            ForEach(userDict.keys.sorted(), id:\.self){user in
                if let data = userDict[user] as? [String:Any]{
                    if user == username{
                        ForEach(data.keys.sorted(), id:\.self){exercise in
                            HStack{
                                Text(exercise)
                                    .font(.system(size: 35))
                                    .bold()
                                Spacer()
                                if(getExerciseStatus(exercise: exercise, username: user)){
                                    Image(systemName:"square.fill")
                                        .foregroundStyle(Color.green)
                                        .font(.system(size: 70))
                                        .bold()
                                }
                                else{
                                    Image(systemName:"square.fill")
                                        .foregroundStyle(Color.red)
                                        .font(.system(size: 70))
                                        .bold()
                                }
                            }
                            .frame(height:100)
                           }
                        }
                    }
                }
            }
        .frame(width:700)
        .padding()
        }
    
    func getExerciseStatus(exercise:String, username:String) -> Bool{
        let userDict = userInfoObject.userInfo
        for (user, data) in userDict {
            if(user == username){
                for (key, value) in data as! [String : Any] {
                    if(key == exercise){
                        if(value as! Bool == true){
                            return true
                        }
                    }
                }
            }
        }
        return false
    }

    }
        


