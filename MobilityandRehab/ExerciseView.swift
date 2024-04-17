//
//  ExerciseView.swift
//  MobilityandRehab
//
//  Created by Teodor Djuric on 2/2/24.
//

import Foundation
import SwiftUI

struct ExerciseView: View {
    
    @EnvironmentObject var viewobject:RehabViewmodel
    var exerciseName: String
    
    var body: some View {
            VStack{
                List{
                    ForEach(viewobject.ExerciseArray, id:\.Exercise){
                        Currentexercise in
                        if Currentexercise.Exercise == exerciseName{
                            HStack{
                                Spacer()
                                Text(Currentexercise.Exercise)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size:50))
                                    .foregroundStyle(.orange)
                                Spacer()
                            }
                            
                            HStack{
                                VStack{
                                    Spacer()
                                    WebView(videoID: Currentexercise.videoId)
                                        .frame(width: 900, height: 562.5, alignment: .center)
                                    Spacer()
                                    
                                    Text(Currentexercise.notes)
                                        .font(.system(size:50))
                                        .foregroundStyle(.orange)
                                    
                                    Text(Currentexercise.notes)
                                        .font(.system(size:50))
                                    HStack{
                                        Spacer()
                                        Image("HerseyLogo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height:100, alignment: .center)
                                    }
                                }
                                
                            }
                        }
                    }
    
                }
                
                .scrollContentBackground(.hidden)

                .listRowBackground(Color.gray)
            }
        }
    }
    

