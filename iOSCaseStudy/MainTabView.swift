//
//  MainTabView.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import SwiftUI


struct MainTabView: View {
    @State private var selectedTab = 0  // 0: Movies, 1: Favorites, 2: Profile

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                MovieView()
            }
            .tabItem {
                Label("Movies", systemImage: "film")
            }
            .tag(0)

            NavigationStack {
                FavoritesView()
            }
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }
            .tag(1)

            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
            .tag(2)
        }
        .onAppear {
            selectedTab = 0  // Her açıldığında Movies sekmesi seçili olsun
        }
    }
}


#Preview {
    MainTabView()
}
