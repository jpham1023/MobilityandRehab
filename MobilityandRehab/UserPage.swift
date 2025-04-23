//shows educator screen where they have options to add youtube videos + log out

// currrent functionality: add new youtube videos, assign youtube videos(have yet to install), log out, and reset password
import SwiftUI
import SwiftData
import FirebaseAuth
import FirebaseDatabase

struct UserPage: View{
    @State var showAlert:Bool = false
    @EnvironmentObject var appState: AppState
    @State var showResetText = false
    @StateObject var adminViewmodel = UserViewmodel()
    @StateObject var settingsViewmodel = UserSettingsViewmodel()
    @EnvironmentObject var authManager: AuthenticationManager
    @State var userName:String = ""
    var body: some View{
        
        ScrollView{
            Spacer()
                .frame(height:25)
            VStack{
                Image(systemName: "person.circle.fill")
                    .font(.system(size:100))
                if(!userName.isEmpty){
                    Spacer()
                    Text(userName)
                        .font(.system(size:20))
                    Spacer()
                        .frame(height:25)
                }
                HStack{
                    Text("Welcome back!")
                        .font(.system(size:45))
                }
                
                
            }
            .onAppear(){
                Task{
                    await getUserName()
                }
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
                        .font(.system(size:25))
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
                    .font(.system(size:25))
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
                                .font(.system(size:25))
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
                                            appState.educatorLogIn = false
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
                                .font(.system(size:25))
                        }
                        
                    })
                    .alert(isPresented: $showResetText) {
                        return  Alert(title:Text("Success"), message: Text("Check email to reset your password"),dismissButton: .default(Text("Ok")))
                    }
                    
        }
        
        
    }
    
    func getUserName() async {
        do{
            let authData = try await authManager.getAuthenticatedUser()
            let userEmail = authData.email
            if let atRange = userEmail.range(of:"@"){
                let name = userEmail[..<atRange.lowerBound]
                userName = String(name)
                print(userName)
            }
        }
        catch{
            print("Error handling mark as done: \(error)")
        }
    }



}
