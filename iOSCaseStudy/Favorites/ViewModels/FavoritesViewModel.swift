//
//  FavoritesViewModel.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 26.05.2025.
//

import Foundation

class FavoritesViewModel: ObservableObject{
    
    //MARK: - Properties
    @Published var likedMoviesList: [Movie] = []
    
    
    //MARK: - Functions
    func getLikedMoviesList(token: String){
        let endpoint = Endpoint.likedMovieList(token: token)
        
        NetworkManager.shared.request(endpoint) { [weak self] (result: Result<[Movie], NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let movieList):
                    self?.likedMoviesList = movieList
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
}
