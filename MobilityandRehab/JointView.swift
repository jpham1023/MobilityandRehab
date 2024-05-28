//
//  JointView.swift
//  MobilityandRehab
//
//  Created by Dylan Domeracki on 2/2/24.
//

import Foundation
import SwiftUI

struct JointView: View{
    var currentRegion: String
    @EnvironmentObject var viewObject: RehabViewmodel
    var body: some View{
        NavigationStack{
            List(){
                ForEach(viewObject.JointArray, id:\.Joint){
                    currentJoint in
                    if currentJoint.Regions == currentRegion{
                        HStack{
                            NavigationLink(destination:ExerciseList(currentJoint: currentJoint.Joint)){
                                Text(currentJoint.Joint)
                                   .font(.system(size:100))
                                   .font(.title)
                                   .foregroundStyle(.white)
                                   .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                   .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                                
                            }
                        }
                        .frame(height:150)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                .ignoresSafeArea()
                .cornerRadius(10)
            }
            //            .background {
            //                Color(red: 177/255, green: 176/255, blue: 176/255)
            //                    .ignoresSafeArea()
            //
            //            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Joints")
        }
    }
}
