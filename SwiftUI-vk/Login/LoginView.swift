//
//  LoginView.swift
//  SwiftUI-vk
//
//  Created by Алексей Логинов on 10.08.2022.
//
import SwiftUI
import Combine

struct LoginView: View {
    
    //MARK: _ @State
    @State  var login: String
    @State  var password: String
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrentCredentialsWarning = false
    @State  var isUserLoggedIn: Bool
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false })
    
        .removeDuplicates()
    //MARK: - Body
    var body: some View {
        
        ZStack {
            GeometryReader { _ in Image("logo")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                // .aspectRatio(contentMode: .fill)
                
            }
            .frame(height: 200)
        }
        
        ScrollView(showsIndicators: false){
            
            
            VStack{
                if shouldShowLogo {
                    Text ("VKclient")
                        .font(.system(size: 60))
                        .foregroundColor(Color(red: 0.308, green: 0.482, blue: 0.745))
                        .padding([.top, .leading, .trailing], 0)
                    
                    
                }
                VStack{
                    HStack {
                        loginInput
                    };
                    HStack{
                        passwordInput
                    }
                    
                }
                .frame(maxWidth: 250)
                .padding(10)
                
                
                Button(action: verifyLoginData) {
                    Text("Log in")
                }
                .padding(.top, 5)
                .padding(.bottom, 5)
                .disabled(login.isEmpty || password.isEmpty)
                .frame(width: 250)
                .background(Color(red: 0.308, green: 0.482, blue: 0.745))
                .cornerRadius(10)
                .tint(.white)
            }
            
        }
        .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.easeInOut(duration: 0.5)) {
            self.shouldShowLogo = !isKeyboardOn }
        }
        
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert(isPresented: $showIncorrentCredentialsWarning,
               content: {Alert(title:   Text("Error"),message: Text("Incorrent Login/Password was entered"))
        })
        
    }
    
    private func verifyLoginData() {
        if login == "11" && password == "11" {
            isUserLoggedIn = true
        } else {
            showIncorrentCredentialsWarning = true
        }
        // сбрасываем пароль, после проверки для лучшего UX
        password = "" }
    
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(login: "", password: "", isUserLoggedIn: true)
        
    }
}

//MARK: UIAplication
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//MARK: pprivate extension

private extension LoginView {
    var passwordInput: some View {
        HStack {
            Text("Password:")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 0.308, green: 0.482, blue: 0.745))
            Spacer()
            SecureField("Enter password...", text: $password)
                .frame(maxWidth: 150)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(10)
        }
    }
}


private extension LoginView {
    var loginInput: some View {
        HStack {
            Text("Login:")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 0.308, green: 0.482, blue: 0.745))
            Spacer()
            SecureField("Enter login ID", text: $login)
                .frame(maxWidth: 150)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(10)
        }
    }
}
