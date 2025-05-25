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
    
}
