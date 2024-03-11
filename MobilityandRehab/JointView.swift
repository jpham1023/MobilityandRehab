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
                                    .font(.custom("subheadline", size: 100))
                            }
                            }
                        }
                    }
                }.listRowBackground(Color.gray)
            }
        .listStyle(InsetGroupedListStyle())
        }
    }
