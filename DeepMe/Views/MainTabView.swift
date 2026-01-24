//
//  MainTabView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 1/23/2026.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore = false
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SettingsView(hasLaunchedBefore: $hasLaunchedBefore)
                .tabItem {
                    Label("Ustawienia", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
