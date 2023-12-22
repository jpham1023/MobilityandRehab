//
//  ExersiseModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import Foundation
import SwiftUI

class Exersise{
    init(joint: String, Exersise: String, video: String, notes: String) {
        self.joint = joint
        self.Exersise = Exersise
        self.video = video
        self.notes = notes
    }
    var joint:String
    var Exersise:String
    var video:String
    var notes:String
    
}
struct RegionArea:Hashable{
    init(Joint: String, Regions: String) {
        self.Regions = Regions
        self.Joint = Joint
        
    }
    var Joint:String
    var Regions:String
}
