//
//  UserCard.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 26.05.2025.
//

import SwiftUI

struct UserCard: View {
    let user: CurrentUser

    // Kullanıcının ad ve soyadının baş harflerini alıyoruz
    private var initials: String {
        let firstInitial = user.name.first.map { String($0) } ?? ""
        let lastInitial = user.surname.first.map { String($0) } ?? ""
        return firstInitial + lastInitial
    }

    var body: some View {
        HStack(spacing: 16) {
            // Baş harflerin olduğu renkli daire
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.8))
                    .frame(width: 64, height: 64)
                    .shadow(radius: 4)

                Text(initials)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text("\(user.name) \(user.surname)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)

                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("\(user.likedMovies.count) favori film")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}
