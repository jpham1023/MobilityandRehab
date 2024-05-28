import SwiftUI

final class signInViewmodel: ObservableObject{
    @Published var email:String = ""
    @Published var password: String = ""
    
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else{
            return
        }
    let returnedUserData = try await AuthenticationManager.authManager.createUser(email:email, password:password)

    }
}

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var signIn:Bool = false
    @State private var passwordLength = false
    @State private var navigateLogin:Bool = false
    @StateObject var viewmodel = signInViewmodel()
    
    var body: some View {
        Image(systemName: "person.badge.plus")
            .font(.system(size:50))
        Text("Sign Up")
            .font(.system(size:40))
        VStack {
            TextField("Username", text: $viewmodel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewmodel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            if signIn{
                Text("Success!")
                    .bold()
                    .foregroundStyle(.green)
            }
            Button(action:{
                if confirmPassword.count < 6{
                    passwordLength = true
                }
                Task{
                    do{
                       try await viewmodel.signIn()
                    }
                    catch{
                        print("couldnt sign in")
                    }
                    
                }
                let authUser = try? AuthenticationManager.authManager.getAuthenticatedUser()
                signIn = authUser != nil
            }, label: {
                Text("Create Account")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 253/255, green: 102/255, blue: 26/255))
                    .cornerRadius(8)
            })
            
            .padding()
        }
        .padding()
        .alert(isPresented:$passwordLength){
            Alert(title:Text("error"), message: Text("Password must be 6 characters"),dismissButton: .default(Text("Ok")))
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Passwords do not match"), dismissButton: .default(Text("OK")))
        }
        
    }
    
    func checkPassword() {
        if password != confirmPassword {
            showAlert = true
            return
        }
    }
    
}
