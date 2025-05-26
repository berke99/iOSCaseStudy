//
//  ProfileDetailView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 26.05.2025.
//

import SwiftUI

struct ProfileDetailView: View {
    var user: CurrentUser

    @StateObject var profileDetailVM = ProfileDetailViewModel()
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""

    private var token: String? {
        UserDefaults.standard.string(forKey: "tokenKey")
    }
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            
            // Editable Fields
            VStack(alignment: .leading, spacing: 12) {
                Text("Update")
                    .font(.title2)
                    .bold()
                
                CTextField(text: $name, placeholder: "Name")
                    .padding()
                    .cornerRadius(8)
                
                CTextField(text: $surname, placeholder: "Surname")
                    .padding()
                    .cornerRadius(8)
                
                CTextField(text: $email, placeholder: "Email")
                    .padding()
                    .cornerRadius(8)
            }
            
            Divider()
            
            // Display Current User Info
            VStack(alignment: .leading, spacing: 12) {
                Text("User")
                    .font(.title2)
                    .bold()
                
                InfoRow(label: "Name", value: user.name)
                InfoRow(label: "Surname", value: user.surname)
                InfoRow(label: "Email", value: user.email)
            }
            
            CButton(title: "Update") {
                profileDetailVM.updateProfile(token: token! , name: name, surname: surname, email: email) { success in
                    if success  {
                        print("success")
                        dismiss()
                    }else{
                        print("error update user")
                    }
                }
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .onAppear {
            name = user.name
            surname = user.surname
            email = user.email
        }
    }
}

// Küçük yardımcı View
struct InfoRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}
