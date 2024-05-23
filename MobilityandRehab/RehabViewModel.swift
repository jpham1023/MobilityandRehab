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
    @Published  var JointArray:[jointType] = []
    @Published var regionArray: [String] = []
    @Published var ExerciseArray: [Exercise] = []
    @Published var educatorLogged:Bool = false
    
    init(){
        pullfromfirebase()
    }
    
    func addExerciseToFirebase(currentJointType:jointType, currentExerciseType: Exercise){
        let databaseref = Database.database().reference()
        databaseref.child("Region").child(currentJointType.Regions).child(currentJointType.Joint).setValue(currentExerciseType.Exercise)
        databaseref.child("Region").child(currentJointType.Regions).child(currentJointType.Joint).child(currentExerciseType.Exercise).setValue(currentExerciseType.videoId)
        databaseref.child("Region").child(currentJointType.Regions).child(currentJointType.Joint).child(currentExerciseType.Exercise).setValue(currentExerciseType.notes)
        databaseref.child("Region").child(currentJointType.Regions).child(currentJointType.Joint).child(currentExerciseType.Exercise).setValue(currentExerciseType.video)



    }
    
    func pullfromfirebase() {
        let databaseref = Database.database().reference().child("Region")
        databaseref.getData { myError,myDataSnapshot in
            var tempJointArray: [jointType] = []
            var tempExerciseArray: [Exercise] = []
            var tempRegionArray: [String] = []
            for region in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
                let regionName = region.key
                tempRegionArray.append(regionName)
                self.regionArray = tempRegionArray
                guard let jointdictionary = region.value as? [String:Any] else {return}
                for jointName in jointdictionary.keys{
                    guard let exerciseDictionary = jointdictionary[jointName] as? [String:Any] else {return}
                    for exercises in exerciseDictionary{
                        let exerciseName = exercises.key
                        guard let linkDictionary = exercises.value as? [String:Any] else{return}
                        guard let link = linkDictionary["Link"] else{return}
                        guard let notes = linkDictionary["Note"] else{return}
                        guard let videoID = linkDictionary["ID"] else{return}
                        let currentExercise = Exercise(joint: jointName, Exercise: exerciseName, video: link as! String, notes: notes as! String, videoID: videoID as! String)
                        tempExerciseArray.append(currentExercise)
                    }
                    let currentJoint = jointType(Joint: jointName, Regions: regionName)
                    if tempJointArray.contains(currentJoint) == false{
                        tempJointArray.append(currentJoint)
                    }
                }
                
                
                
            }
            self.JointArray = tempJointArray
            self.ExerciseArray = tempExerciseArray
            
            
            
        }
        
    }
    
}
