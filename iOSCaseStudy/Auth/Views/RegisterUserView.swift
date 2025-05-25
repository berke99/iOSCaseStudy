//
//  RegisterUserView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import SwiftUI

struct RegisterUserView: View {
    //MARK: - Properties
    @StateObject private var authVM = AuthViewModel()

    @State private var name: String = ""
    @State private var surName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    //MARK: - View
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 16){
                
                // TextField'ler
                CTextField(text: $name, placeholder: LocaleKeys.namePlaceholder.rawValue)
                CTextField(text: $surName, placeholder: LocaleKeys.surNamePlaceholder.rawValue)
                CTextField(text: $email, placeholder: LocaleKeys.emailPlaceholder.rawValue)
                    .keyboardType(.emailAddress)
                CTextField(text: $password, placeholder: LocaleKeys.passwordPlaceholder.rawValue)
                
                // Buttonlar
                CButton(title: LocaleKeys.signUpButton.rawValue) {
                    authVM.registerUser(name: name, surName: surName, email: email, password: password)
                    
                }
                .padding(.vertical, 15)
                
            }
            .navigationTitle(LocaleKeys.registerTitle.rawValue)
        }
        
    }
    
    //MARK: - Functions
}

#Preview {
    RegisterUserView()
}
