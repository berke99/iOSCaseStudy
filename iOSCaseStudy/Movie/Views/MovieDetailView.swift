//
//  MovieDetailView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                KFImage(URL(string: movie.posterURL ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                
                Text(movie.title ?? "Unknown Title")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(movie.year ?? 0)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", movie.rating ?? 0))
                }
                
                Text(movie.category ?? "Unknown Category")
                    .font(.caption)
                    .padding(8)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
                
                if let description = movie.description {
                    Text(description)
                        .font(.body)
                        .padding(.top)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(movie.title ?? "Movie Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

