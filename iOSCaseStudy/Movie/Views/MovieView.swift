//
//  MovieView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI

struct MovieView: View {
    //MARK: - Properties
    @StateObject var movieVM = MovieViewModel()
    
    //MARK: - Views
    var body: some View {
        NavigationStack{
            VStack{
                List(movieVM.movies ?? []) { movie in
                    MovieCard(movie: movie)
                }
            }
            .navigationTitle(LocaleKeys.movieFeedTitle.rawValue)
            .onAppear {
                movieVM.getAllMovies()
            }
        }
    }
    
    //MARK: - Functions
}

#Preview {
    MovieView()
}
