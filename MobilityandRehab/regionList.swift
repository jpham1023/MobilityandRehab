//
//  regionList.swift
//  MobilityandRehab
//
//  Created by Kazuya Nishizaka on 3/7/24.
//

import Foundation
struct regionList: View{
    @EnvironmentObject var viewobject:RehabViewmodel
    var body: some View{
        {
            Text("Regions")
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
                                }
                            .frame(height:150)
                        }
                    }
                }
                
            }
        }
    }
}
