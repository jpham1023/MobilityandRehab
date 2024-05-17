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
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .frame(width:650, height:75)
                            Text("Lets Go")
                                .font(.system(size:35))
                                .frame(width:150,height:50)
                                .foregroundColor(.white)
                        }
                    }

                    NavigationLink(destination:SignInView()){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .frame(width:650, height:75)
                            Text("Sign In")
                                .font(.system(size:35))
                                .frame(width:150,height:50)
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
