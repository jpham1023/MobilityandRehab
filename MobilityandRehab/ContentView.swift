//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("Regions")
            .foregroundColor(.orange)
        let nameArray = viewobject.regionArray
        NavigationStack{
            List{
                ForEach(nameArray,id:\.self){
                    currentRegion in
                    HStack{
                        NavigationLink(destination: JointView(currentRegion: currentRegion)){
                            Text(currentRegion)
                                .foregroundColor(.orange)
                                .font(.system(size:100))
                                .font(.title)
                            }
                        .frame(height:150)
                    }
                }
            }
        }
       
    }
}

#Preview {
    ContentView()
}
