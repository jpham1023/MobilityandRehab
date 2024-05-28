//
//  ExerciseList.swift
//  MobilityandRehab
//
//  Created by Marcus Lustria on 2/2/24.
//

import Foundation
import SwiftUI

struct ExerciseList: View {
    var iconList: [String] = ["figure.strengthtraining.functional","figure.wave", "figure.cooldown","figure.cross.training","figure.run","figure.dance", "figure.yoga","figure.gymnastics","figure.rolling","figure.pilates", "figure.highintensity.intervaltraining","figure.step.training"]
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
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                    .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                                Spacer()
                                    Image(systemName: iconList.randomElement()!)
                                    .font(.system(size:35))

                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                .ignoresSafeArea()
            }
            .navigationTitle("Exercises")
            
        }
        
        
    }
}
