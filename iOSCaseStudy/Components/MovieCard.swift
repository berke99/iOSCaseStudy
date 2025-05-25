//
//  MovieCard.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI
import Kingfisher

struct MovieCard: View {
    let movie: Movie

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            KFImage(URL(string: movie.posterURL ?? ""))
                .placeholder {
                    ProgressView()
                        .frame(width: 80, height: 120)
                }
                .resizable()
                .cancelOnDisappear(true)
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 120)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .shadow(radius: 2)

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title ?? "Unknown Title")
                    .font(.headline)

                Text("\(movie.year ?? 0)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(String(format: "%.1f", movie.rating ?? 0))
                        .font(.caption)
                }

                Text(movie.category ?? "Unknown")
                    .font(.caption2)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(4)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

