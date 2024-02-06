//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewobject: RehabViewmodel
    var body: some View {
        Text("Regions")
        let regions = RegionNames()
        let nameArray = regions.appendRegions(viewobject: viewobject)
        NavigationStack{
            List{
                ForEach(nameArray,id:\.self){
                    currentRegion in
                    @State var regionname = currentRegion
                    HStack{
                        
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
