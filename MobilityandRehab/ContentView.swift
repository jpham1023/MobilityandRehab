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
                  .border(Color.orange)
                  .padding()
                Text("Believe you can and you are already halfway there")
                 .font(.system(size:30))
                  .bold()
                  .multilineTextAlignment(.center)
                 Text("-Theodore Roosevelt")
                    .font(.system(size:30))
                    .bold()
                     .multilineTextAlignment(.center)
            }
                            
            }
        }
    }
}
