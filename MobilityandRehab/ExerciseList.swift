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
            List {
                ForEach(viewobject.ExerciseArray, id: \.Exercise) {
                    currentExercise in
                    if currentExercise.joint == currentJoint {
                        HStack {
                            NavigationLink(destination:ExerciseView(exerciseName: currentExercise.Exercise)) {
                                Text(currentExercise.Exercise)

                                    .font(.system(size:100))
                                
                            }
                        }
                    }
                }
            }
        }
    }
}
