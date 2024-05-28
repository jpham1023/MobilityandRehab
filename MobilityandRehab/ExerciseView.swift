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
    @State var tapped: Bool = false
    
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
                                    .foregroundStyle(.white)
                                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                    .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                                Spacer()
                            }
                            .background(Image("Orange"))
                            
                            HStack{
                                VStack{
                                    Spacer()
                                    WebView(videoID: Currentexercise.videoId)
                                        .frame(width: 750, height: 550, alignment: .center)
                                    Spacer()
                                }
                                VStack{
                                    Text("Instructions")
                                        .font(.system(size:38))
                                        .foregroundStyle(Color(red:253/255,green: 102/255, blue:26/255))
                                        .padding()
                                    Text(Currentexercise.notes)
                                        .font(.system(size:20))
                                        .foregroundStyle(Color(red:253/255,green: 102/255, blue:26/255))
                                    
                                    Spacer()
                                    Text("Mark as done")
                                        .font(.system(size:35))
                                        .foregroundStyle(Color(red:253/255,green: 102/255, blue:26/255))
                                    Button {
                                        tapped = !tapped
                                    } label: {
                                        Image(systemName:"square.fill")
                                            .foregroundStyle(tapped ? Color.green : Color.gray)
                                            .font(.system(size:40))
                                    }

                                    Spacer()
                                    Image("HerseyLogo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:100, alignment: .center)
                                }
                                .frame(width:230,height:600)
                                .overlay(){
                                    RoundedRectangle(cornerRadius:15)
                                        .stroke(Color.gray)
                                }
                            }
                        }
                    }
    
                }
                
            }
        }
    }
