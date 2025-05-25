//
//  loginUserView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import SwiftUI

struct LoginUserView: View {
    //MARK: - Properties
    @StateObject private var authVM = AuthViewModel()
    
    @State private var navigateToRegister = false

    @State private var email: String = "john@example.com"
    @State private var password: String = "password123"
    
    // Alert için state
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    //MARK: - View
    var body: some View {
        
        NavigationStack {
        
                VStack(alignment: .leading, spacing: 16){
                    
                    // TextField'ler
                    CTextField(text: $email, placeholder: LocaleKeys.emailPlaceholder.rawValue)
                        .keyboardType(.emailAddress)
                    CTextField(text: $password, placeholder: LocaleKeys.passwordPlaceholder.rawValue)
                        .keyboardType(.default)
                    
                    // Buttonlar
                    HStack(){
                        CButton(title: LocaleKeys.loginButton.rawValue) {
                            print("loginButton tapped")
                            authVM.loginUser(email: email, password: password)
                        }
                        CButton(title: LocaleKeys.signUpButton.rawValue) {
                            print("signUpButton tapped")
                            navigateToRegister = true
                        }

                    }
                    .padding(10)

                    NavigationLink(
                        destination: RegisterUserView(),
                        isActive: $navigateToRegister,
                        label: { EmptyView() }
                    )
                    
                }
                .navigationTitle(LocaleKeys.loginTitle.rawValue)
                .onReceive(authVM.$loginError) { error in
                    if let error = error {
                        alertMessage = error.localizedDescription
                        showAlert = true
                    }
                }
                .onReceive(authVM.$loggedInUser) { user in
                    if let user = user {
                        print(user)
                    }
                }
                
                // Alert gösterimi
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Hata"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("Tamam")) {
                            showAlert = false
                        }
                    )
                }

        }

    }
    
    //MARK: - Functions
    
}

#Preview {
    LoginUserView()
}


