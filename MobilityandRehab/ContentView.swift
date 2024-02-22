//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewobject:RehabViewmodel
    var body: some View {
        Text("Regions")
        let nameArray = viewobject.regionArray
        NavigationStack{
            List{
                ForEach(nameArray,id:\.self){
                    currentRegion in
                    HStack{
                        NavigationLink(destination: JointView(currentRegion: currentRegion)){
                            Text(currentRegion)
                            }
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
