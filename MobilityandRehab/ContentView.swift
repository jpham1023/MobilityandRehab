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
                Text("Rehab Me")
                
                    .font(.system(size: 65))
                
                Image("HerseyLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:400)
                    .padding()
                NavigationLink(destination:regionList()){
                    ZStack{
                        
                        Rectangle()
                            .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                            .frame(width:650, height:50)
                        Text("Sign In")
                            .font(.system(size:35))
                            .frame(width:650,height:50)
                            .foregroundColor(.white)
                    }
                    NavigationLink(destination:regionList()){
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .frame(width:650, height:200)
                            Text("Lets Go")
                                .font(.system(size:35))
                                .frame(width:600,height:50)
                                .foregroundColor(.white)
                            // NavigationLink(destination:regionList()){
                            
                        }
                        
                    }.background {
                        Color(.gray)
                            .ignoresSafeArea()
                    }
                }
            }
        }
    }
}
