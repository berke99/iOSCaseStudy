//
//  loginUserView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import SwiftUI

struct LoginUserView: View {
    @StateObject private var authVM = AuthViewModel()
    
    @State private var navigateToRegister = false
    @State private var navigateToMovieView = false  // Yeni state
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                CTextField(text: $email, placeholder: LocaleKeys.emailPlaceholder.rawValue)
                    .keyboardType(.emailAddress)
                CTextField(text: $password, placeholder: LocaleKeys.passwordPlaceholder.rawValue)
                    .keyboardType(.default)
                
                HStack {
                    CButton(title: LocaleKeys.loginButton.rawValue) {
                        authVM.loginUser(email: email, password: password)
                    }
                    CButton(title: LocaleKeys.signUpButton.rawValue) {
                        navigateToRegister = true
                    }
                }
                .padding(10)

                NavigationLink(destination: RegisterUserView(), isActive: $navigateToRegister) {
                    EmptyView()
                }
                
                NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true), isActive: $navigateToMovieView) {
                    EmptyView()
                }
            }
            .navigationTitle(LocaleKeys.loginTitle.rawValue)
            .onReceive(authVM.$loginError) { error in
                if let error = error {
                    alertMessage = error.localizedDescription
                    showAlert = true
                }
            }
            .onReceive(authVM.$loggedInUser) { user in
                if user != nil {
                    navigateToMovieView = true
                }
            }
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
}

#Preview {
    LoginUserView()
}


