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
         let regions = currentJointType.Regions as NSString
         let joint = currentJointType.Joint as NSString
          let exercise = currentExerciseType.Exercise as NSString
         let ID = currentExerciseType.videoId as NSString
          let video = currentExerciseType.video as NSString
          let notes = currentExerciseType.notes as NSString
            let exerciseData: [String: Any] = [
                "ID": ID,
                "Link": video,
                "Note": notes
            ]
        databaseref.child("Region").child(regions as String).child(joint as String).updateChildValues([exercise: NSDictionary()])
        databaseref.child("Region").child(regions as String).child(joint as String).child(exercise as String).updateChildValues(exerciseData)

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
