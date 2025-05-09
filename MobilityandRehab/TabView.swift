import SwiftUI

struct tabBar: View{
    @Binding var currNavigation:String
    var body: some View{
        TabView(selection: $currNavigation){
            
            //displays the home page of the app
            NavigationStack{
                ContentView()
                
            }
            .tag("one")
            .tabItem{
                Image(systemName: "house.fill")
                    .resizable()
                   .scaledToFit()
            }
            
            
            //displays the regions that show videos
            NavigationStack{
                regionList()
                
            }

            .tabItem{
                Image(systemName: "figure.flexibility")
                   
            }
            
            //displays the user log in screen
            NavigationStack{
                UserView()
            }
            .tag("SignUp")
            .tabItem{
                Image(systemName: "person.circle.fill") 
            }
        }
    }
    
}

