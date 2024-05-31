//
//  regionList.swift
//  MobilityandRehab
//
//  Created by Kazuya Nishizaka on 3/7/24.
//

import Foundation
import SwiftUI

struct regionList: View{
    @EnvironmentObject var viewobject:RehabViewmodel
    var body: some View{
        var regionBackgroundArray:[String:String] = ["Leg":"Legs", "Trunk":"Trunk", "Shoulder": "Shoulder"]
        let nameArray = viewobject.regionArray
        NavigationStack{
            List{
                ForEach(nameArray,id:\.self){
                    currentRegion in
                    HStack{
                        NavigationLink(destination: JointView(currentRegion: currentRegion)){
                            Text(currentRegion)
                                .font(.system(size:100))
                                .foregroundStyle(.white)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                                
                        }
//
                        .frame(height:180)
                    }
                    .background(Image(regionBackgroundArray[currentRegion]!))
                }
                
            }
            
            
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Regions")
    }
}
