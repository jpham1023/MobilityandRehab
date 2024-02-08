//
//  MobilityandRehabApp.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
// test - Dylan

import SwiftUI
import FirebaseCore


@main

struct MobilityandRehabApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        @StateObject var viewobject:RehabViewmodel = RehabViewmodel()
        WindowGroup {
            ContentView()
                .environmentObject(viewobject)
        }
    }
}
