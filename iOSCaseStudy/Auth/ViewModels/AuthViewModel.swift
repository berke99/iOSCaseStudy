//
//  AuthViewModel.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var loggedInUser: User?
    @Published var loginError: NetworkError?
    @Published var showErrorAlert: Bool = false

    // MARK: - Functions
    func loginUser(email: String, password: String) {
        let endpoint = Endpoint.loginUser(email: email, password: password)
        
        NetworkManager.shared.request(endpoint) { [weak self] (result: Result<User, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    print("Login başarılı, token: \(user)")
                    self?.loggedInUser = user
                    self?.loginError = nil
                case .failure(let error):
                    print("Login hatası: \(error)")
                    self?.loginError = error
                    self?.loggedInUser = nil
                }
            }
        }
    }
    
    
    
    
}
