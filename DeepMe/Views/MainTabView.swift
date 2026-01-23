//
//  MainTabView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 1/23/2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SettingsView()
                .tabItem {
                    Label("Ustawienia", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
