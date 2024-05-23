//
//  ExersiseModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import Foundation
import SwiftUI
import SwiftData

class Exercise {
    init(joint: String, Exercise: String, video: String, notes: String, videoID: String) {
        self.joint = joint
        self.Exercise = Exercise
        self.video = video
        self.notes = notes
        self.videoId = videoID
        
    }
    var joint: String
    var Exercise: String
    var video: String
    var notes: String
    var videoId:String
    
}
struct jointType: Hashable{
    init(Joint: String, Regions: String) {
        self.Regions = Regions
        self.Joint = Joint
        
    }
    var Joint: String
    var Regions: String
}



