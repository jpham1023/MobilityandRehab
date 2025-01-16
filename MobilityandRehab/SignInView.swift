import SwiftUI
import FirebaseAuth

final class signInViewmodel: ObservableObject{
    @Published var email:String = ""
    @Published var password: String = ""
    
    func signUp() async throws{
        guard !email.isEmpty, !password.isEmpty else{
            return
        }
    let returnedUserData = try await AuthenticationManager.authManager.createUser(email:email, password:password)

    }
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else{
            return
        }
        let returnedUserData = try await AuthenticationManager.authManager.signIn(email:email, password:password)

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
    @State private var errorText = ""
    @State private var errorTextAlert = false
    @StateObject var viewmodel = signInViewmodel()
    @StateObject var adminViewmodel = UserViewmodel()
    @State private var currentNav:String = "one"
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Image(systemName: "person.badge.plus")
            .font(.system(size:50))
        Text("Sign Up")
            .font(.system(size:40))
        VStack {
            TextField("Email", text: $viewmodel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewmodel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            if signIn{
                Text("Success! User Created")
                    .bold()
                    .foregroundStyle(.green)
                
            }
            Button(action:{
                checkPassword()
                if passwordLength == false && !showAlert{
                    Task{
                        
                        do{
                            try await viewmodel.signUp()
                            signIn = true
                            currentNav = "SignUp"
                            appState.userIsSignedIn = true
                        if let userEmail = Auth.auth().currentUser?.email{
                            if adminViewmodel.adminArray.contains(userEmail) {
                                appState.educatorLogIn = true
                            }
                        }
                            return
                        }
                        catch{
                        let error = error as NSError
                            print(error)
                            handleAuthError(error: error)
              }
            do{
                try await viewmodel.signIn()
            }
                catch{
                            
            }
                    }
                }
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
            Alert(title:Text("Error"), message: Text("Password must be 6 characters"),dismissButton: .default(Text("Ok")))
        }
        .alert(isPresented: $errorTextAlert){
            Alert(title:Text("Error"), message: Text(errorText), dismissButton: .default(Text("Ok")))
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Passwords do not match"), dismissButton: .default(Text("OK")))
        }
        
    }
    
    func checkPassword() {
        // Check if password is too short
        if viewmodel.password.count < 6 {
            passwordLength = true
            print("Password length too short")
        }
        // Check if passwords match
        if viewmodel.password != confirmPassword {
            showAlert = true
            print("Passwords do not match")
        } else {
            passwordLength = false
            showAlert = false
        }
    }
    
    func handleAuthError(error:NSError){
        if let ErrorCode = AuthErrorCode.Code(rawValue: error.code){
            switch ErrorCode{
            case .invalidEmail:
                errorText = "Enter a valid email address"
            case .emailAlreadyInUse:
                errorText = "This email is already connected to an existing user. Try logging in"
            case .weakPassword:
                errorText = "Password is too weak. Enter a new one."
            case .networkError:
                errorText = "Network error. Could not connect to database. Try again later"
            case .tooManyRequests:
                errorText = "Too many requests. Try again later"
            case .internalError:
                errorText = "An internal error has occured"
            default:
                errorText = "Sorry an unknown error has occured"
            }
            errorTextAlert = true
            print(errorText)
    }
    }
    
}
