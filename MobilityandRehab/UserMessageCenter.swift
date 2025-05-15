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
    var body: some View{
        let messageArray = userMessageObj.userMessage as [String: NSDictionary]
        VStack{
            Spacer()
            Image(systemName: "message.circle")
                .font(.system(size:50))
            Text("Assignments")
                .font(.system(size:45))
                .bold()
            List{
                ForEach(messageArray.keys.sorted(), id:\.self){ messages in
                                       
                }
            }
            
        }
    }
}

