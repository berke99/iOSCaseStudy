//
//  MovieViewModel.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import Foundation

class MovieViewModel: ObservableObject{
    
    //MARK: - Properties
    @Published var movies: [Movie]? = nil
    @Published var likedMovies: [Movie] = []
    @Published var unLikedMovies: [Movie] = []
    
    
    //MARK: - Functions
    func getAllMovies(){
        let endpoint = Endpoint.movie
        
        NetworkManager.shared.request(endpoint) { [weak self] (result: Result<[Movie], NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                    self?.movies = []
                }
            }
        }
        
    }
    
    func likeMovie(id: String){
        guard let token = UserDefaults.standard.string(forKey: "userToken") else {
            print("Token bulunamadı.")
            return
        }

        let endpoint = Endpoint.likeMovie(id: id, token: token)

        NetworkManager.shared.request(endpoint) { [weak self] (result: Result<Movie, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let likedMovie):
                    self?.likedMovies.append(likedMovie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func unLikeMovie(id: String){
        guard let token = UserDefaults.standard.string(forKey: "userToken") else {
            print("Token bulunamadı.")
            return
        }
        
        let endpoint = Endpoint.unLikeMovie(id: id, token: token)
        
        NetworkManager.shared.request(endpoint) { [weak self] (result: Result<Movie, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let unLikedMovie):
                    self?.unLikedMovies.append(unLikedMovie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    }
    
}
