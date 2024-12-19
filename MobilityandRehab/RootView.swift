//Root user View that all users see when they are not signed in
//  RootView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/28/24.
//

import SwiftUI

struct RootView: View{
    @State var showLogIn: Bool = false
    @State var showSignUp: Bool = false
    var body: some View{
        ZStack{
            Image("Exercise")
                .resizable()
                .scaledToFit()
                .frame(width:1000,height:780)
                .padding()
            VStack{
                Text("Welcome! Let's get started")
                    .bold()
                    .font(.system(size:45))
                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                Spacer()
                
                
                HStack{
                    Spacer()
                        .frame(width:550)
                    VStack{
                        Button(action:{
                            triggerSignUp()
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                    .frame(width:300,height:50)
                                Text("Sign Up")
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        })
                        Text("Already have an account?")
                            .bold()
                            .frame(width:300)
                        Button(action: {
                            triggerLogIn()
                        }
                               , label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                    .frame(width:300,height:50)
                                Text("Log In")
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        })
                      
                    }
                }
                .frame(width:600, height:200)
                .padding()
            }
            .frame(height:600)
            .padding()
            
            
        }
        //if user clicked log in, display the log in view
        .sheet(isPresented: $showLogIn, onDismiss: {showLogIn = false}, content: {
            LogInView()
        })
        
        //if user clicked signUp a signup page will appear and same thing with Log in
        .sheet(isPresented: $showSignUp, onDismiss: {
            showSignUp = false
        }, content: {
            SignInView()
        })
    }
    func triggerSignUp(){
        showSignUp = true
    }
    func triggerLogIn(){
        showLogIn = true
    }
}

