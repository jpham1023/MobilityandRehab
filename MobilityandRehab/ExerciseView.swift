//
//  ExerciseView.swift
//  MobilityandRehab
//
//  Created by Teodor Djuric on 2/2/24.
//

import Foundation
import SwiftUI

struct ExerciseView: View {
    
    @EnvironmentObject var viewobject:RehabViewmodel
    var exerciseName: String
    
    var body: some View {
        List{
            ForEach(viewobject.ExerciseArray, id:\.Exercise){
                Currentexercise in
                if Currentexercise.Exercise == exerciseName{
                    Text(Currentexercise.video)
                        .frame(width: 300, height: 600)
                    Text(Currentexercise.notes)
                }
            }
        }
    }
}

