//
//  UserPage.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/20/24.
//

import SwiftUI
import SwiftData

struct UserPage: View{
    @Query var userLogged: [userLogged]
    @State var showAlert:Bool = false
    @EnvironmentObject var viewobject: RehabViewmodel
    var body: some View{
        if checkIfLoggedIn(userDict: userLogged){
            ScrollView{
                VStack{
                    Image(systemName: "figure.wave")
                        .font(.system(size:50))
                    Text("Welcome Back!")
                        .font(.system(size:50))
                }
                .padding()
                if checkIfEducator(viewobject: viewobject){
                    NavigationLink(destination: addVideo()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:400, height:75)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                            Text("Add youtube videos")
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:400, height:75)
                            .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                        Text("Assign Youtube Videos")
                            .bold()
                            .foregroundStyle(.white)
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:400, height:75)
                            .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                        Text("Manage Students")
                            .bold()
                            .foregroundStyle(.white)
                    }
                }
                else{
                    HStack{
                            Text("Assignments")
                                .font(.title)
                                .font(.system(size:35))
                                .foregroundStyle(.green)
                            Image(systemName: "message.fill")
                                .foregroundStyle(.green)
                            
                        }
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:275, height:75)
                                .foregroundStyle(.gray)
                            NavigationLink {
                                ExerciseView(exerciseName: "Multidirectional Dynamic Ankle")
                            } label: {
                                Text("Dynamic Ankle")
                                    .foregroundStyle(.white)
                            }

                        }
                        .padding()
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:275, height:75)
                                .foregroundStyle(.gray)
                            NavigationLink {
                                ExerciseView(exerciseName: "Rotator Cuff Exercise")
                            } label: {
                                Text("Rotator Cuff Exercise")
                                    .foregroundStyle(.white)
                            }

                        }
                        Spacer()
                    }
                    .frame(width:300,height:400)
                    .border(.white)
                    .padding()
                        
            
                    
                }
                    
            Button(action: {
                showAlert = true
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundStyle(.red)
                                .frame(width:200,height:50)
                            Text("Log out")
                                .foregroundStyle(.white)
                    }
                })
                    
                    
                    
                }
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Log out"),
                        message: Text("Are you sure you want to log out?"),
                        primaryButton: .default(
                            Text("Yes"),
                            action: {
                                logOut(userChange: userLogged)
                                logOutEducator(viewobject: viewobject)
                            }
                        ),
                        secondaryButton: .default(Text("No"))
                    )
        }
                
            }
            
        
        else{
            SignInView()
        }
        
    }
}
func logOutEducator(viewobject:RehabViewmodel){
    viewobject.educatorLogged = false
}

func checkIfEducator(viewobject: RehabViewmodel) -> Bool{
    if viewobject.educatorLogged == true{
        return true
    }
    return false
}
func checkIfLoggedIn(userDict:[userLogged]) -> Bool{
    for users in userDict{
        if users.loggedIn == true{
            return true
        }
    }
    return false
}
func logOut(userChange:[userLogged]){
    for users in userChange{
        users.loggedIn = false
    }
}
