//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var showingPopover = false
    var body: some View {
        VStack {
            NavigationStack{
                ScrollView(){
                    Text("REHAB ME")
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                        .font(.system(size: 80))
                        .bold()
                        .frame(height:100)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                        .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                    Image("HerseyLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height:400)
                        .border(Color.orange, width: 4)
                        .cornerRadius(10)
                        .offset(y:35)
                        .padding()
                    VStack{
                        Text("Believe you can and you are already halfway there \n -Theodore Roosevelt")
                            .font(.system(size:30))
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                            .padding()
                        Button(action: {
                        showingPopover = true
                    }, label: {
                                Image(systemName: "info.circle.fill")
                            .font(.system(size:25))
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                })
                .popover(isPresented: $showingPopover) {
                Text("Developed By: Jenny Pham, Marcus Lustria, Kazuya Nishizaka, Teo Djuric, and Dylan Domeracki")
                .font(.headline)
                    .padding()
                                                }
                    }

                }
                
            }
        }
    }
}
