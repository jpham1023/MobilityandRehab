//
//  rehabViewModel.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import Foundation
import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

class RehabViewmodel: ObservableObject{
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
    init(){
        pullfromfirebase()
        
    }
    
    func pullfromfirebase() {
        let databaseref = Database.database().reference().child("Region")
        databaseref.getData { myError,myDataSnapshot in
        var tempJointArray: [jointType] = []
        var tempExerciseArray: [Exercise] = []
        //print(myDataSnapshot)
        for region in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
            let regionName = region.key
            guard let jointdictionary = region.value as? [String:Any] else {return}
            for jointName in jointdictionary.keys{
                guard let exerciseDictionary = jointdictionary[jointName] as? [String:Any] else {return}
                for exercises in exerciseDictionary{
                    guard let exerciseName = exercises.key as? String else{return}
                    guard let linkDictionary = exercises.value as? [String:Any] else{return}
                    guard let link = linkDictionary["link"] else{return}
                    guard let notes = linkDictionary["Note"] else{return}
                    let currentExercise = Exercise(joint: jointName, Exercise: exerciseName, video: link as! String, notes: notes as! String)
                    tempExerciseArray.append(currentExercise)
                    let currentJoint = jointType(Joint: jointName, Regions: regionName)
                    tempJointArray.append(currentJoint)
                }
                let currentJoint = jointType(Joint: jointName, Regions: regionName)
                tempJointArray.append(currentJoint)
            }
            
                    
            }
           self.JointArray = tempJointArray
        self.ExerciseArray = tempExerciseArray     
            
                    

            }
            
        }
        
    }
    
    
