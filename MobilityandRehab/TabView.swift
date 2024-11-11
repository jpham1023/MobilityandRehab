import SwiftUI

struct tabBar: View{
    var body: some View{
        TabView{
            
            //displays the home page of the app
            NavigationStack{
                ContentView()
                
            }
            .tabItem{
                Image(systemName: "house.fill")
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
            .tabItem{
                Image(systemName: "person.circle.fill")
            }
        }
    }
    
}

