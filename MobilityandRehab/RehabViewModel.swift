//
//  rehabViewModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import Foundation
import SwiftUI

class viewmodel: ObservableObject{
    @Published  var JointArray:[jointType] = [
    jointType(Joint: "Back", Regions: "Shoulder"),
    jointType(Joint: "triceps", Regions: "Shoulder"),
    jointType(Joint: "Calves", Regions: "Legs")
    ]
    
    @Published var ExerciseArray: [Exercise] = [
    Exercise(joint: "Back", Exercise: "Extentions", video: "www.yt.com", notes: "notes"),
    Exercise(joint: "Back", Exercise: "Raises", video: "www.youtube.com", notes: "Dont cave shoulders"),
    Exercise(joint: "triceps", Exercise: "pullups", video: "www.yt.com", notes: "none"),
    Exercise(joint: "Calves", Exercise: "calf raises", video: "www.yt.com", notes: "no notes")
    
    ]
    func pullfromfirebase(){
        
    }
    
    
}
