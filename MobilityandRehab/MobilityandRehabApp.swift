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
    var body: some Scene {
        @StateObject var viewobject:RehabViewmodel = RehabViewmodel()
        WindowGroup {
            //creates the tab screen at the bottom
            tabBar()
                .environmentObject(viewobject)
                .modelContainer(for: userLogged.self)
            
        }
    }
}
