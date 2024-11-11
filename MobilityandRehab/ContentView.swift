//
//  ContentView.swift
//  MobilityandRehab
//
//  Created by Jenny Pham on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
//    }
    
    @State var showingPopover = false
    @State var quoteNum = Int.random(in: 1...5)
    var body: some View {
        VStack {
            NavigationStack{
                ScrollView(){
                    Text("REHAB ME")
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                        .font(.system(size: 80))
                        .bold()
                        .frame(height:100)
                    Image("HerseyLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height:400)
                        .border(Color.orange, width: 4)
                        .cornerRadius(10)
                        .offset(y:35)
                        .padding()
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                        .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                    
                    //displays the different quotes
                    VStack{
                        if quoteNum == 1{
                            Text("Believe you can and you are already halfway there \n-Theodore Roosevelt")
                                .font(.system(size:30))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .offset(y:45)
                                .shadow(color: .black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                        } else if quoteNum == 2{
                            Text("Either you run the day or the day runs you \n-Jim Rohn")
                                .font(.system(size:30))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .offset(y:45)
                                .shadow(color: .black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                        } else if quoteNum == 3{
                            Text("The pain you feel today is the strength you feel tomorrow \n-Stephen Richards")
                                .font(.system(size:30))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .offset(y:45)
                                .shadow(color: .black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                        } else if quoteNum == 4 {
                            Text("Fitness is not about being someone else. It's about being better than you used to be \n-Unknown")
                                .font(.system(size:30))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .offset(y:45)
                                .shadow(color: .black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                        } else if quoteNum == 5{
                            Text("Stop doubting yourself. Work hard and make it happen. \n-Unknown")
                                .font(.system(size:30))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                .offset(y:45)
                                .shadow(color: .black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                        }
                        
                        
                //information icon that displays the developers of app
                        Button(action: {
                        showingPopover = true
                    }, label: {
                        VStack(){
                            Spacer()
                                .frame(height:50)
                            Image(systemName: "info.circle.fill")
                                .font(.system(size:25))
                        }
                        
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                                })
                .popover(isPresented: $showingPopover) {
                Text("Developed By: Jenny Pham, Marcus Lustria, Kazuya Nishizaka, Teodor Djuric, and Dylan Domeracki")
                .font(.headline)
                    .padding()
                                                }
                    }

                }
                
            }
        }
        .preferredColorScheme(.dark)
    }
}
