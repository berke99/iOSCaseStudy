//
//  ProfileDetailViewModel.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 26.05.2025.
//

import Foundation

class ProfileDetailViewModel: ObservableObject{
    
    //MARK: - Functions
    func updateProfile(token: String, name: String, surname: String, email: String ,completion: @escaping(Bool) -> Void){
        let endpoint = Endpoint.updateUser(token: token, name: name, surname: surname, email: email)

        print("Sending request to URL: \(endpoint.url)")
        print("Request method: \(endpoint.method.rawValue)")
        print("Headers: \(endpoint.headers)")
        print("Parameters: \(endpoint.parameters ?? [:])")

        NetworkManager.shared.request(endpoint) {(result: Result<UpdateUserResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    completion(true)
                    
                    
                case .failure(let error):
                    
                    
                    
                    completion(false)
                }
            }
        }
    }
    
}
