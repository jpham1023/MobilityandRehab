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
                            Text(Currentexercise.Exercise)
                                .font(.system(size:50))
                                .foregroundStyle(.orange)
                                .multilineTextAlignment(.center)
                                .frame(width:1000)
                            HStack{
                                Spacer()
                                WebView(videoID: Currentexercise.videoId)
                                    .frame(width: 900, height: 562.5, alignment: .center)
                                Spacer()
                            }
                            Text(Currentexercise.notes)
                                .font(.system(size:50))
                                .foregroundStyle(.orange)
                            HStack{
                                Text(Currentexercise.notes)
                                    .font(.system(size:50))
                                Spacer()
                                Image("HerseyLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:100, alignment: .center)
                                
                            }
                        }
                    }
    
                }
                .background {
                    Color(red: 177/255, green: 176/255, blue: 176/255)
                        .ignoresSafeArea()

                }
                .scrollContentBackground(.hidden)

                .listRowBackground(Color.gray)
            }
        }
    }
    

