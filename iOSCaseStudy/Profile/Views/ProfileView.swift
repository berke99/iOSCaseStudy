//
//  ProfileVierw.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties
    @StateObject var authVM = AuthViewModel()

    @State private var isProfileDetailActive = false

    @State private var isLoggedOut = false
    @State private var token: String? = nil
    
    
    
    //MARK: - Views
    var body: some View {
        VStack{
    
            if let user = authVM.currentUser {
                UserCard(user: user)
            }
            
            VStack{
                CButton(title: "Update Profile") {
                    isProfileDetailActive = true
                }
                
                CButton(title: "Log out") {
                    authVM.deleteToken()
                    isLoggedOut = true
                }
            }
            .padding(.vertical)
            if let user = authVM.currentUser {                
                NavigationLink(destination: ProfileDetailView(user: user),
                               isActive: $isProfileDetailActive) {
                    EmptyView()
                }
            }

        }
        .padding()
        .onAppear {
            token = UserDefaults.standard.string(forKey: "userToken")

            if let token = token {
                authVM.getCurrentUser(token: token)
            }
        }
        .fullScreenCover(isPresented: $isLoggedOut) {
            LoginUserView()
        }
        
    }
}

#Preview {
    ProfileView()
}


