//
//  FavoritesView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 26.05.2025.
//

import SwiftUI

struct FavoritesView: View {
    //MARK: - Properties
    @StateObject private var favoritesVM = FavoritesViewModel()
    
    //MARK: - Views
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(favoritesVM.likedMoviesList) { movie in
                        MovieCard(movie: movie)
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
        }
        .onAppear {
            if let token = UserDefaults.standard.string(forKey: "userToken"){
                favoritesVM.getLikedMoviesList(token: token)
            }else{
                print("user token yok")
            }
        }
    }
        
}

#Preview {
    FavoritesView()
}
