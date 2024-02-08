//
//  RegionArray.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 2/2/24.
//

import Foundation
import SwiftUI

struct RegionNames{
    func appendRegions() -> [String]{
        @EnvironmentObject var viewobject:RehabViewmodel
        var regionName:[String] = []
        let jointArray = viewobject.JointArray
        for name in jointArray{
            if regionName.contains(name.Regions) == false{
                regionName.append(name.Regions)
            }
        }
        return regionName
    }
}
