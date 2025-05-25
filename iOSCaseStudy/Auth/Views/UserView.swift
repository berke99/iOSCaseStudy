//
//  UserView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI

struct UserView: View {
    @State private var token: String? = nil
    
    @StateObject private var authVM = AuthViewModel()
    
    var body: some View {

        Text("User View")
        CButton(title: "ben hangi kullancıyım") {
            if let token = token {
                authVM.getCurrentUser(token: token)
            }
        }
        .onAppear {
            self.token = authVM.getToken()
        }
    }
}

#Preview {
    UserView()
}
