//
//  MainTabView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MovieView()
            }
            .tabItem {
                Label("Movies", systemImage: "film")
            }

            NavigationStack {
                //FavoritesView()
            }
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }

            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}
#Preview {
    MainTabView()
}
