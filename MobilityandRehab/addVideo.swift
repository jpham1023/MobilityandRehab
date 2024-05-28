//
//  addVideo.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 5/20/24.
//

import SwiftUI
import Foundation

struct addVideo: View{
    @State var videoUrl:String = ""
    @State var videoID:String? = ""
    @State var enteredID:String = ""
    @State var textEntered: Bool = false
    @State var chooseRegion = "Pick a region"
    @State var chooseJoint = "Pick a joint"
    @State var chooseExercise = ""
    @State var chooseNotes = ""
    @State var regionSelected = false
    @State var jointSelected = false
    @State var showingPopover = false
    @EnvironmentObject var viewobject:RehabViewmodel
    var idGenerator = videoIDGenerator()
    var body: some View{
        let jointArray:[jointType] = viewobject.JointArray
        let regionArray:[String] = viewobject.regionArray
        ScrollView{
            HStack{
                Text("Add youtube video")
                    .bold()
                    .font(.system(size:37))
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color.red)
                        .frame(width:100,height:50)
                    Image(systemName: "arrowtriangle.right.fill")
                        .foregroundStyle(.white)
                        .font(.system(size:30))
                }
            }
            .padding()
            .border(.white)
            HStack{
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color(.gray))
                            .frame(width:490, height:50)
                        
                        TextField("Enter url", text: $videoUrl)
                            .foregroundStyle(.white)
                            .frame(width:490)
                    }
                    Button(action: {
                        videoID = idGenerator.extractVideoId(url: videoUrl)
                        textEntered = true
                    }, label: {
                        Image(systemName: "plus.app.fill")
                            .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                            .font(.system(size:45))
                    })
                    .foregroundStyle(.orange)
                }
                Spacer()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color(.gray))
                            .frame(width:490, height:50)
                        TextField("Enter video ID", text: $enteredID)
                            .frame(width:490)
                    }
                    
                    Button(action: {videoID = enteredID; textEntered = true}, label: {
                        Image(systemName: "plus.app.fill")
                            .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                            .font(.system(size:45))
                    })
                }
            }
            .padding()
            if textEntered{
                HStack{
                    WebView(videoID: videoID ?? "zkdkPigEMGA")
                        .frame(width:600, height:400)
                        .border(Color(red: 253/255, green: 102/255, blue: 26/255))
                    Button(action: {
                                                showingPopover = true
                                            }, label: {
                                                Image(systemName: "info.circle.fill")
                                                    .font(.system(size:25))
                                                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                            })
                    .popover(isPresented: $showingPopover) {
                        Text("Video unavailable means this link will not show up on the screen and should not be added")
                            .font(.headline)
                            .padding()
                    }
                    VStack{
                        Menu{
                            ForEach(regionArray, id:\.self){
                                currentRegion in
                                Button(action: {
                                    chooseRegion = currentRegion
                                    regionSelected = true
                                }, label: {
                                    Text(currentRegion)
                                     
                                })
                            }
                        } label:{
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width:200, height: 50)
                                    .foregroundStyle(.gray)
                                Text("\(chooseRegion)")
                                    .foregroundStyle(regionSelected ? Color.green : Color(UIColor.placeholderText))
                            }
                        }
                        .font(.system(size:30))
                        .padding()
                        Menu{
                            ForEach(jointArray, id:\.self){
                                currentJoint in
                                Button(action: {
                                    chooseJoint = currentJoint.Joint
                                    jointSelected = true
                                }, label: {
                                    Text(currentJoint.Joint)
                                })
                            }
                        } label:{
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width:200, height: 50)
                                    .foregroundStyle(.gray)
                                Text("\(chooseJoint)")
                                    .foregroundStyle(jointSelected ? Color.green :Color(UIColor.placeholderText))
                            }
                        }
                        .font(.system(size:30))
                        .padding()
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width:200, height: 50)
                                    .foregroundStyle(.gray)
                                TextField("Name of exercise", text: $chooseExercise)
                                    .font(.system(size:26))
                                    .foregroundStyle(Color.green)
                                    .frame(width:200, height:45)
                            }
                        .font(.system(size:30))
                        .padding()
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:200, height: 50)
                                .foregroundStyle(.gray)
                            TextField("Enter Notes", text: $chooseNotes)
                                .font(.system(size:28))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.green)
                                .frame(width:200, height:45)
                        }
                        .font(.system(size:30))
                        .padding()
                        Button(action: {
                            let newJoint = jointType(Joint: chooseRegion, Regions: chooseJoint)
                            let newExercise = Exercise(joint: chooseJoint, Exercise: chooseExercise, video: videoUrl, notes: chooseNotes, videoID: videoID!)
                            viewobject.addExerciseToFirebase(currentJointType: newJoint, currentExerciseType: newExercise)
                            videoUrl = ""
                            chooseExercise = ""
                            chooseRegion = "Pick a region"
                            chooseJoint = "Pick a joint"
                            regionSelected = false
                            jointSelected = false
                            
                        }, label: {
                            Image(systemName: "plus.app.fill")
                                .font(.system(size:45))
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                        })
                        
                    }
                    .padding()
                    .frame(width:300,height:500)
                    
                }
                
            }
        }
        
    }
}

struct videoIDGenerator{
    func extractVideoId(url:String) ->String?{
        let urlPattern = "(?:https?:\\/\\/)?(?:www\\.)?(?:youtube\\.com\\/(?:[^\\/\\n\\s]+\\/\\S+\\/(?:videos)?|(?:v|e(?:mbed)?)\\/|\\S*?[?&]v=)|youtu\\.be\\/)([a-zA-Z0-9_-]{11})"
        do{
            let regex = try NSRegularExpression(pattern: urlPattern, options: .caseInsensitive)
            let nsString = url as NSString
            let matches = regex.matches(in: url, options: [], range: NSRange(location:0, length: nsString.length))
            if let match = matches.first{
                return nsString.substring(with: match.range(at:1))
            }
            
            
        }
    catch let error {
        print("Could not find videoID try different link")
    }
        return nil
        
    }
}

