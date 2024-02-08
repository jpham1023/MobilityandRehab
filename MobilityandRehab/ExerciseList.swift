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
    @Binding var currentJoint:  String
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewobject.ExerciseArray, id: \.Exercise) {
                    currentExercise in
                    if currentExercise.joint == currentJoint {
                        @State var exercisename = currentExercise.Exercise
                        HStack {
                            Text(exercisename)
                            NavigationLink("") {
                                ExerciseView(exerciseName: $exercisename)
                            }
                        }
                    }
                }
            }
        }
    }
}
