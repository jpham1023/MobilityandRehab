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
                Text("Lets Go")
                    .font(Font.custom("Fruit Banana", size: 75))
                    .foregroundColor(Color(red: 253/255, green: 102/255, blue: 26/255))
                    .bold()
                    .font(.title)
            }
        }
       
    }
}

#Preview {
    ContentView()
}
