
//
//  UserMessageCenter.swift
//  MobilityandRehab
//
//  Created by Quyen T. Pham on 5/15/25.
//
import Foundation
import SwiftUI
struct MessageCenter: View{
    @EnvironmentObject var userMessageObj:UserMessage
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View{
        var messageArray = userMessageObj.userMessage as [String: NSDictionary]
        VStack{
            Spacer()
                .frame(height:35)
            Image(systemName: "message.circle")
                .font(.system(size:50))
            Text("Assignments")
                .font(.system(size:45))
                .bold()
            List{
                ForEach(messageArray.keys.sorted(), id:\.self){ user in
                    if(checkUserNameStored(nameToCheck: user)){
                        if let messageDict = messageArray[user] as? [String:String]{
                            ForEach(messageDict.keys.sorted(), id:\.self){ messages in
                                Text(messageDict[messages as String]!)
                                    .font(.system(size:25))
                                    .bold()
                                    .swipeActions(){
                                        Button(role:.destructive){
                                            print(messages)
                                            userMessageObj.removeMessage(key: messages as String, currentUser: returnNameOfEmail())
                                        }label:{
                                            Image(systemName:"trash.fill")
                                        }
                                    }
                            }
                        }
                    }
                        
                }
                
            }
            
            
        }
    }
    
    func returnNameOfEmail()->String{
        do{
            let authData = try authManager.getAuthenticatedUser()
            let userEmail = authData.email
            if let atRange = userEmail.range(of:"@"){
                let name = userEmail[..<atRange.lowerBound]
                return String(name)
            }
        }
        catch{
            print("Error getting user")
        }
        return ""
    }
    func checkUserNameStored(nameToCheck:String) -> Bool{
        let name = returnNameOfEmail()
        if name == nameToCheck{
            return true
        }
        return false
    }
    
    
}


