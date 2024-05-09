//
//  ExerciseList.swift
//  MobilityandRehab
//
//  Created by Marcus Lustria on 2/2/24.
//

import Foundation
import SwiftUI

struct ExerciseList: View {
    @EnvironmentObject var viewobject: RehabViewmodel
    var currentJoint:  String
    var body: some View {
        NavigationStack {
            navigationTitle("Exercise List")
            List {
                ForEach(viewobject.ExerciseArray, id: \.Exercise) {
                    currentExercise in
                    if currentExercise.joint == currentJoint {
                        HStack {
                            NavigationLink(destination:ExerciseView(exerciseName: currentExercise.Exercise)) {
                                Text(currentExercise.Exercise)
                                    .font(.system(size:100))
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                .ignoresSafeArea()
            }
            
        }
        
        
    }
}
