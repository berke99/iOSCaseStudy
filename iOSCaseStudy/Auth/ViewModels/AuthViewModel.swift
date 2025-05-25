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
    @Published var currentUser: CurrentUser?
    
    
    // MARK: - Functions
    func loginUser(email: String, password: String) {
        let endpoint = Endpoint.loginUser(email: email, password: password)
        
        NetworkManager.shared.request(endpoint) { [weak self] (result: Result<User, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    //print("Login başarılı, token: \(user)")
                    self?.loggedInUser = user
                    self!.saveToken(user: user)
                    self?.loginError = nil
                case .failure(let error):
                    print("Login hatası: \(error)")
                    self?.loginError = error
                    self?.loggedInUser = nil
                }
            }
        }
    }
    
    func registerUser(name: String, surName: String ,email: String, password: String ){
        let endpoint = Endpoint.registerUser(name: name, surname: surName, email: email, password: password)
        
        NetworkManager.shared.request(endpoint) { [weak self] (result: Result<User, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.loginError = nil
                    self?.loggedInUser = user
                    self!.saveToken(user: user)
                case .failure(let error):
                    print("Login hatası: \(error)")
                    self?.loginError = error
                    self?.loggedInUser = nil

                }
            }
        }
    }
    
    func getCurrentUser(token: String){
        let endpoint = Endpoint.currentUser(token: token)
        
        NetworkManager.shared.request(endpoint){ [weak self] (result: Result<CurrentUser, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    print("success")
                    print(user)
                    self?.currentUser = user
                case .failure(let error):
                    print("error")
                    print(error)
                }
            }
        }
    }
    
    func saveToken(user: User){
        UserDefaults.standard.set(user.token, forKey: "userToken")
        print("Token başarıyla kaydedildi: \(user.token)")
        self.loggedInUser = user
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: "userToken")
    }

    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: "userToken")
        print("Token başarıyla silindi.")
        self.loggedInUser = nil
    }

}
