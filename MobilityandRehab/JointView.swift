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

                                    .font(Font.custom("Fruit Banana", size: 75))
                            }
                            }
                        }
                    }
            
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .ignoresSafeArea()
            }
            .background {
                Color(red: 177/255, green: 176/255, blue: 176/255)
                    .ignoresSafeArea()

            }
            .scrollContentBackground(.hidden)

        }
    }
                        }
