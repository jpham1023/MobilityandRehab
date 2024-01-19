//
//  ExersiseModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import Foundation
import SwiftUI

class Exercise{
    init(joint: String, Exercise: String, video: String, notes: String) {
        self.joint = joint
        self.Exercise = Exercise
        self.video = video
        self.notes = notes
    }
    var joint: String
    var Exercise: String
    var video: String
    var notes: String
    
}
struct RegionArea: Hashable{
    init(Joint: String, Regions: String) {
        self.Regions = Regions
        self.Joint = Joint
        
    }
    var Joint: String
    var Regions: String
}
