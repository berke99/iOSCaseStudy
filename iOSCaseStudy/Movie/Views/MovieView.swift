//
//  MovieView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI
import SwiftUI

struct MovieView: View {
    // MARK: - Properties
    @StateObject var movieVM = MovieViewModel()

    // MARK: - Views
    var body: some View {
        NavigationStack {
            List(movieVM.movies ?? []) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieCard(movie: movie)
                        .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
            .navigationTitle(LocaleKeys.movieFeedTitle.rawValue)
            .onAppear {
                movieVM.getAllMovies()
            }
        }
    }
    
}

#Preview {
    MovieView()
}
