//
//  Ad_listApp.swift
//  Ad-list
//
//  Created by Roman Tsymbaliuk on 10/01/2026.
//

import SwiftUI

@main
struct Ad_listApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}


enum Tab {
    case home
    case favorite
}

struct MainTabView: View {
    let appContainer = AppContainer()
    
    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView(viewModel: appContainer.makeAdListViewModel())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            FavoritesAdView(viewModel: appContainer.makeFavoriteAdListViewModel())
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
                .tag(Tab.favorite)
        }
    }
}
