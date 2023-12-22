//
//  rehabViewModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import Foundation
import SwiftUI

class viewmodel: ObservableObject{
    @Published  var RegionArray:[RegionArea] = [
    RegionArea(Joint: "Back", Regions: "Shoulder"),
    RegionArea(Joint: "triceps", Regions: "Shoulder"),
    RegionArea(Joint: "Calves", Regions: "Legs")
    ]
    
    @Published var exeriseArray: [Exersise] = [
    Exersise(joint: "Back", Exersise: "Extentions", video: "www.yt.com", notes: "notes"),
    Exersise(joint: "Back", Exersise: "Raises", video: "www.youtube.com", notes: "Dont cave shoulders"),
    Exersise(joint: "triceps", Exersise: "pullups", video: "www.yt.com", notes: "none"),
    Exersise(joint: "Calves", Exersise: "calf raises", video: "www.yt.com", notes: "no notes")
    
    ]
    
    
    
}
