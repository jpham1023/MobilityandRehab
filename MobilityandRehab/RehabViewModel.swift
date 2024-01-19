//
//  rehabViewModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import Foundation
import SwiftUI

class viewmodel: ObservableObject{
    @Published  var JointArray:[RegionArea] = [
    RegionArea(Joint: "Back", Regions: "Shoulder"),
    RegionArea(Joint: "triceps", Regions: "Shoulder"),
    RegionArea(Joint: "Calves", Regions: "Legs")
    ]
    
    @Published var ExerciseArray: [Exercise] = [
    Exercise(joint: "Back", Exercise: "Extentions", video: "www.yt.com", notes: "notes"),
    Exercise(joint: "Back", Exercise: "Raises", video: "www.youtube.com", notes: "Dont cave shoulders"),
    Exercise(joint: "triceps", Exercise: "pullups", video: "www.yt.com", notes: "none"),
    Exercise(joint: "Calves", Exercise: "calf raises", video: "www.yt.com", notes: "no notes")
    
    ]
    
    
    
}
