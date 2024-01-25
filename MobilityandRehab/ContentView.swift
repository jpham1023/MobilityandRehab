//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

struct ContentView: View {
    @ObservedObject var viewmodel = RehabViewmodel()
    var body: some View {
        VStack {
            Text("text")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
