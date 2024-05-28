import SwiftUI

struct tabBar: View{
    var body: some View{
        TabView{
            NavigationStack{
                ContentView()
                
            }
            .tabItem{
                Image(systemName: "house.fill")
            }
            NavigationStack{
                regionList()
                
            }
            .tabItem{
                Image(systemName: "figure.flexibility")
            }
            NavigationStack{
                RootView()
            }
            .tabItem{
                Image(systemName: "person.circle.fill")
            }
        }
    }
    
}

