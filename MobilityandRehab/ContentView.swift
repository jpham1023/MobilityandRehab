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
                    .bold()
                    .font(.system(size: 65))
                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                    .font(.system(size: 80))
                    .frame(height:70)
                
                Image("HerseyLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:400)
                    .padding()
                VStack{
                    NavigationLink(destination:regionList()){
                        ZStack {
                            RoundedRectangle(cornerRadius: 60)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .frame(width:650, height:200)
                            Text("Lets Go")
                                .font(.system(size:60))
                                .frame(width:600,height:50)
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
                    .frame(height: 35)
                VStack{
                    NavigationLink(destination:SignInView()){
                        ZStack{
                            RoundedRectangle(cornerRadius: 60)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .frame(width:650, height:200)
                            Text("Sign In (WIP)")
                                .font(.system(size:60))
                                .frame(width:600,height:50)
                                .foregroundColor(.white)
                        }
                    }
                }
            }.background {
                Color(.gray)
                    .ignoresSafeArea()
            }
        }
    }
}
