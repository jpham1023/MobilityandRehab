//
//  MobilityandRehabApp.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI
import FirebaseCore


@main

struct MobilityandRehabApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
