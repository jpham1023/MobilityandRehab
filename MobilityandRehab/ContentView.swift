//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            Text("Rehab Me")
                .font(.title)
                .font(Font.custom("Fruit Banana", size: 75))
            Image("HerseyLogo")
                .resizable()
                .scaledToFit()
                .frame(height:200)
            NavigationLink(destination:regionList()){
                ZStack{
                    Rectangle()
                        .foregroundStyle(.green)
                        .frame(width:75, height:25)
                    Text("Lets Go")
                        .frame(width:75,height:50)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            
        }.background {
            Color(.gray)
                .ignoresSafeArea()
        }
    }
}
