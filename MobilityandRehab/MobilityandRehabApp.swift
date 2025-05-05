//
//  MobilityandRehabApp.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.

import SwiftUI
import FirebaseCore
import SwiftData


@main
struct MobilityandRehabApp: App {
    init(){
        FirebaseApp.configure()
    }
    @State var defaultTag = "one"
    @StateObject var appLogIn = AppState()
    @StateObject var viewobject:RehabViewmodel = RehabViewmodel()
    @StateObject var userInfoObject:UserInfoViewmodel = UserInfoViewmodel()
    @StateObject var authManager:AuthenticationManager = AuthenticationManager()
    var body: some Scene {
        WindowGroup {
            //creates the tab screen at the bottom
            
            
//            tabBar(currNavigation: $defaultTag)
//                .environmentObject(viewobject)
//                .environmentObject(appLogIn)
//                .environmentObject(userInfoObject)
//                .environmentObject(authManager)
            StudentAssignmentView(username:"asleep")
                .environmentObject(viewobject)
                           .environmentObject(appLogIn)
                           .environmentObject(userInfoObject)
                           .environmentObject(authManager)
            
        }
    }
}
