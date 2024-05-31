import SwiftUI
import SwiftData
import FirebaseAuth

struct UserPage: View{
    @Query var userLogged: [userLogged]
    @State var showAlert:Bool = false
    @Binding var showSignIn: Bool
    @State var showResetText = false
    var body: some View{
        
        ScrollView{
            VStack{
                Image(systemName: "figure.wave")
                    .font(.system(size:50))
                Text("Welcome Back!")
                    .font(.system(size:50))
                
            }
            .padding()
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
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:400, height:75)
                    .foregroundStyle(Color(red: 253/255, green: 102/255, blue: 26/255))
                Text("Assign Youtube Videos")
                    .bold()
                    .foregroundStyle(.white)
            }
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
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Log out"),
                            message: Text("Are you sure you want to log out?"),
                            primaryButton: .default(
                                Text("Yes"),
                                action: {
                                    Task{
                                        do{
                                             settingsViewmodel.logOut()
                                            showSignIn = true
                                        }
                                        catch{
                                            print("error")
                                        }
                                    }
                                }
                            ),
                            secondaryButton: .default(Text("No"))
                        )}
                    
                    Button(action: {
                               settingsViewmodel.resetPassword()
                        showResetText = true
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
