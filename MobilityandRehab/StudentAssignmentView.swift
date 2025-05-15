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
    @EnvironmentObject var userMessageObj: UserMessage
    @EnvironmentObject var viewobject:RehabViewmodel
    @State var selectedTab = 0
    @State var message = ""
    @State var chooseExercise = "Pick an exercise"
    var body: some View {
        let ExerciseArray:[Exercise] = viewobject.ExerciseArray
        let userDict = userInfoObject.userInfo
        Spacer()
        Text(username)
            .bold()
            .font(.system(size: 50))
        VStack{
            Picker("Tabs", selection: $selectedTab){
                Text("Progress")
                    .tag(0)
                Text("Assign").tag(1)
            }
            .pickerStyle(.segmented)
            .frame(width:900)
            .padding()
        }
        if selectedTab == 0{
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
            }
        else{
            Spacer()
                .frame(height:40)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .foregroundStyle(.white)
                    VStack{
                        Spacer()
                        Text("Hi there! Please watch")
                            .font(.system(size:25))
                            .foregroundStyle(.black)
                            .bold()
                        Menu{
                            ForEach(ExerciseArray, id:\.Exercise){exercise in
                                Button {
                                    chooseExercise = exercise.Exercise
                                } label: {
                                    Text(exercise.Exercise)
                                        .foregroundStyle(.black)
                                }

                            }
                        }label:{
                            ZStack{
                                RoundedRectangle(cornerRadius:15)
                                    .frame(width:200,height:50)
                                    .foregroundStyle(.gray)
                                Text("\(chooseExercise)")
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius:15)
                                .frame(width:400,height:200)
                                .foregroundStyle(.white)
                            VStack{
                                Spacer()
                                TextEditor(text:$message)
                                    .padding()
                                    .background(.gray)
                                    .foregroundStyle(.black)
                                    .frame(width:400, height:200)
                                    .scrollContentBackground(.hidden)
                                Spacer()
                            }
                        }
                        .frame(width:400, height:200)
                        Spacer()
                    }
                }
                .frame(width:410, height:350)
                .border(Color.gray,width:4)
                Spacer()
                    .frame(height:35)
                Button {
                    Task{
                        await putUserMesssageToFirebase()
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:200, height:50)
                            .foregroundStyle(.blue)
                        Text("Send assignment")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .frame(width:500)
                Spacer()

                
            }
        }
        }
        
    func putUserMesssageToFirebase() async{
        let message = "Hi there! Please watch " + chooseExercise + "/n " + message
        try await userMessageObj.addUserToFirebase(currentUser: username, message: message, exercise: chooseExercise)
        
        
        
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
        


