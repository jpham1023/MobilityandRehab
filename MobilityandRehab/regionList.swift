//
//  regionList.swift
//  MobilityandRehab
//
//  Created by Kazuya Nishizaka on 3/7/24.
//

import Foundation
import SwiftUI

struct regionList: View{
    @EnvironmentObject var viewobject:RehabViewmodel
    var body: some View{
        var regionBackgroundArray:[UIImage] = []
            let nameArray = viewobject.regionArray
            NavigationStack{
                List{
                    ForEach(nameArray,id:\.self){
                        currentRegion in
                        HStack{
                            NavigationLink(destination: JointView(currentRegion: currentRegion)){
                                Text(currentRegion)
                                    .font(.system(size:100))
                                    .font(.title)
                                    .foregroundStyle(.white)
                                //#Added the format for the images but there is no images to add at this current moment
//                                Images(custum)
//                                    .frame(CGSize(width: 200, height: 100))
                                }
                            .frame(height:150)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                                    .ignoresSafeArea()
                }
                
            }
        }
    }

