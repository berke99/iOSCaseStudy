//
//  ProfileVierw.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var authVM = AuthViewModel()
    @State private var isLoggedOut = false

    var body: some View {
        VStack {
            Text("Profile View")
            CButton(title: "Çıkış Yap") {
                authVM.deleteToken()
            }
        }

    }
}

#Preview {
    ProfileView()
}
