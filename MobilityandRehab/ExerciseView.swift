//
//  ExerciseView.swift
//  MobilityandRehab
//
//  Created by Teodor Djuric on 2/2/24.
// view of a single exercise video

import Foundation
import SwiftUI

struct ExerciseView: View {
    
    @EnvironmentObject var viewobject:RehabViewmodel
    var exerciseName: String
    
    var body: some View {
        VStack{
            List{
                ForEach(viewobject.ExerciseArray, id:\.Exercise){
                    Currentexercise in
                    if Currentexercise.Exercise == exerciseName{
                        HStack{
                            Spacer()
                            Text(Currentexercise.Exercise)
                                .multilineTextAlignment(.center)
                                .font(.system(size:50))
                                .foregroundStyle(.white)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                            Spacer()
                            
                        }
                        .background(Image("Orange"))
                        ExerciseVideoView(Currentexercise: Currentexercise)
                        
                    }
                }
            }
            
        }
    }
}

struct ExerciseVideoView: View{
    var Currentexercise: Exercise
    @State var markAsDone: Bool = false
    @State var tapped:Bool = false
    @EnvironmentObject var userInfoObject: UserInfoViewmodel
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View{
        
        HStack{
            VStack{
                Spacer()
                WebView(videoID: Currentexercise.videoId)
                    .frame(width: 750, height: 550, alignment: .center)
                Spacer()
            }
            Spacer()
            VStack{
                Text("Instructions")
                    .font(.system(size:38))
                    .foregroundStyle(Color(red:253/255,green: 102/255, blue:26/255))
                    .padding()
                ScrollView{
                    if(Currentexercise.notes.isEmpty){
                        Text("No notes")
                            .font(.system(size:20))
                            .foregroundStyle(Color(red:253/255,green: 102/255, blue:26/255))
                    }
                    else{
                        Text(Currentexercise.notes)
                            .font(.system(size:20))
                            .foregroundStyle(Color(red:253/255,green: 102/255, blue:26/255))
                    }
                }
                .ignoresSafeArea()
                Spacer()
                    .frame(height:50)
                Text("Mark as done")
                    .font(.system(size:35))
                    .foregroundStyle(Color(red:253/255,green: 102/255, blue:26/255))
                Button {
                    markAsDone = true
                } label: {
                    Image(systemName:"square.fill")
                        .foregroundStyle(tapped ? Color.green : Color.gray)
                        .font(.system(size:40))
                }
                .alert(isPresented: $markAsDone) {
                    if !tapped{
                      return  Alert(
                            title: Text("Mark exercise as done"),
                            message: Text("Are you sure you want to mark as done?"),
                            primaryButton: .default(
                                Text("Yes"),
                                action: {
                                    Task{
                                        await handleMarkAsDoneAction(curExercise: Currentexercise.Exercise,watched: true)
                                    }
                                }
                            ),
                            secondaryButton: .default(Text("No"))
                        )
                    }
                    else{
                        return Alert(
                        title: Text("Unmark?"),
                    message: Text("Would you like to unmark this exercise?"),
                        primaryButton: .default(
                            Text("Yes"),
                            action: {
                                Task{
                                    await handleMarkAsDoneAction(curExercise: Currentexercise.Exercise, watched:false)
                                }
                            }
                        ),
                        secondaryButton: .default(Text("No"))
                )
                    }
                    }
                Spacer()
                    .frame(height:50)
                Image("HerseyLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:100, alignment: .center)
                
            }
            .frame(width:230,height:600)
            .overlay(){
                RoundedRectangle(cornerRadius:15)
                    .stroke(Color.gray)
            }
        }
        .onAppear {
            // Check if the exercise has already been marked as done when the view appears
            Task{
                tapped = await pullMarkAsDoneInfo(curExercise: Currentexercise.Exercise)
            }
        }
    }
    
    //updates firebase so the video is marked as done
    func handleMarkAsDoneAction(curExercise: String, watched: Bool) async {
        do {
            let authData = try await authManager.getAuthenticatedUser()
            let userEmail = authData.email
            if let atRange = userEmail.range(of:"@"){
                let name = userEmail[..<atRange.lowerBound] //get name from email
                let userInfo = UserInfoModel(exercise: curExercise, watched: watched)
                try await userInfoObject.addUserToFirebase(currentUser: String(name), userData: userInfo)
                if(watched == true){
                    tapped = true
                }
                else{
                    tapped = false
                }

            }
        } catch {
            print("Error handling mark as done: \(error)")
        }
    }
    
    //checks if this current exercise is marked as done in firebase
//    func pullMarkAsDoneInfo(curExercise:String) -> Bool{
//        let userArray = userInfoObject.userInfo.values
//            print(userInfoObject.userInfo)
//            for data in userArray{
//                let data = data as! NSDictionary
//                for videos in data{
//                    if (videos.key as! String == curExercise){
//                        if(videos.value as! Bool == true){
//                            tapped = true
//                            return true
//                        }
//                    }
//                }
//            }
//            tapped = false
//            return false
//        }
    
    func pullMarkAsDoneInfo(curExercise:String) async -> Bool{
        let userArray = userInfoObject.userInfo
        print(userInfoObject.userInfo)
        //["asleep": ["Ankle Mobility": true], "qpham6326": ["Back and spine mobility": false, "Hip Flow Routine": true]]
        for users in userArray{
            print(users)
            let users = users as! NSDictionary
            //["asleep": ["Ankle Mobility": true]
            let userName = users.allKeys.first
            if await (checkUserNameStored(nameToCheck: userName as! String)){
                for data in users{
                    if (data.key as! String == curExercise){
                        if(data.value as! Bool == true){
                            tapped = true
                            return true
                        }
                    }
                }
            }
            
        }
        
        
        tapped = false
        return false
    }
    
    func checkUserNameStored(nameToCheck:String) async -> Bool{
        do{
            let authData = try await authManager.getAuthenticatedUser()
            let userEmail = authData.email
            if let atRange = userEmail.range(of:"@"){
                let name = userEmail[..<atRange.lowerBound]
                if name == nameToCheck{
                    return true
                }
            }
        }
        catch{
            print("Error handling mark as done: \(error)")
        }
        return false
    }
}
