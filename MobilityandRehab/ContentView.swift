//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack{
                ScrollView(){
                    Text("REHAB ME")
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                        .font(.system(size: 80))
                        .frame(height:100)
                    Image("HerseyLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height:400)
                        .border(Color.orange, width: 4)
                        .cornerRadius(10)
                        .offset(y:35)
                        .padding()
                    Text("Believe you can and you are already halfway there \n -Theodore Roosevelt")
                        .font(.system(size:30))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                        .offset(y:45)
                }
                
            }
        }
    }
}
