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
                        .frame(width:150, height:75)
                    Text("Lets Go")
                        .font(.system(size:35))
                        .frame(width:600,height:500)
                        .foregroundColor(.white)
                }
            }
            
        }.background {
            Color(.gray)
                .ignoresSafeArea()
        }
    }
}
