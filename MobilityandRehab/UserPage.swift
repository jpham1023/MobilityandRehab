//shows educator screen where they have options to add youtube videos + log out

// currrent functionality: add new youtube videos, assign youtube videos(have yet to install), log out, and reset password
import SwiftUI
import SwiftData
import FirebaseAuth

struct UserPage: View{
    @Query var userLogged: [userLogged]
    @State var showAlert:Bool = false
    @EnvironmentObject var appState: AppState
    @State var showResetText = false
    @StateObject var settingsViewmodel = UserSettingsViewmodel()
    var body: some View{
        
        ScrollView{
            VStack{
                Image(systemName: "figure.wave")
                    .font(.system(size:50))
                Text("Welcome Back!")
                    .font(.system(size:50))
                
            }
            .padding()
            
            
            //takes the educator to the page to add new youtube videos
            NavigationLink(destination: addVideo()) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:400, height:75)
                        .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                    Text("Add youtube videos")
                        .bold()
                        .foregroundStyle(.white)
                }
            }
            
            
            //displays button that currently has no purpose
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:400, height:75)
                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                Text("Assign Youtube Videos")
                    .bold()
                    .foregroundStyle(.white)
            }
            
            //button to log out
                    Button(action: {
                        showAlert = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:400, height:75)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                            Text("Log Out")
                                .bold()
                                .foregroundStyle(.white)
                        }
                    })
            
            //alert that double checks if the user wants to log out
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Log out"),
                            message: Text("Are you sure you want to log out?"),
                            primaryButton: .default(
                                Text("Yes"),
                                action: {
                                    Task{
                                        do{
                                            try settingsViewmodel.logOut()
                                            appState.userIsSignedIn = false
                                        }
                                        catch{
                                            print("error")
                                        }
                                    }
                                }
                            ),
                            secondaryButton: .default(Text("No"))
                        )}
            
            //button to reset password
                    
                    Button(action: {
                        Task{
                            do{
                                try await settingsViewmodel.resetPassword()
                                showResetText = true
                            }
                            catch{
                                print(error)
                            }
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:400, height:75)
                                .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                            Text("Reset Password")
                                .bold()
                                .foregroundStyle(.white)
                        }
                        
                    })
                    .alert(isPresented: $showResetText) {
                        return  Alert(title:Text("Success"), message: Text("Check email to reset your password"),dismissButton: .default(Text("Ok")))
                    }
                    
        }
        
        
    }

}
