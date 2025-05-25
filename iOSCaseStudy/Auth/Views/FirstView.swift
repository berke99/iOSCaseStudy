//
//  UserView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI

struct FirstView: View {
    @State private var token: String? = nil
    @State private var showMovieView = false
    @State private var showLoginView = false

    @StateObject private var authVM = AuthViewModel()
    
    var body: some View {
        VStack {
            Text("Blind id Animasyonu")
        }
        .onAppear {
            self.token = authVM.getToken()
            if let token = token {
                authVM.getCurrentUser(token: token)
                showMovieView = true
            } else {
                showLoginView = true
            }
        }
        .fullScreenCover(isPresented: $showMovieView) {
            MovieView()
        }
        .fullScreenCover(isPresented: $showLoginView) {
            LoginUserView()
        }
    }
}

#Preview {
    FirstView()
}
