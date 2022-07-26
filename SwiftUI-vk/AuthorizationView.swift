//
//  AuthorizationView.swift
//  SwiftUI-vk
//
//  Created by Алексей Логинов on 26.07.2022.
//


import SwiftUI
import Combine

    struct AuthorizationView: View {
        @State private var login = ""
        @State private var password = ""
        @State private var shouldShowLogo: Bool = true
        
        private let keyboardIsOnPublisher = Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
                .map { _ in true },
            NotificationCenter.default.publisher(for:
                                                    UIResponder.keyboardWillHideNotification) .map { _ in false }
        )
            .removeDuplicates()
        
        var body: some View {

            ZStack {
                GeometryReader { _ in Image("logo")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    
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
                        Text("Login:")
                        Spacer()
                        TextField("", text: $login)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    };
                    HStack{
                        Text("Password:")
                        Spacer()
                        SecureField("", text: $password)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                }
                    .frame(maxWidth: 250)
                    .padding(10)
                    
                    
                    Button(action: { print("authorization") }) {
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
        }
    }
        
    extension UIApplication {
        func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
       


struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
            
    }
}
