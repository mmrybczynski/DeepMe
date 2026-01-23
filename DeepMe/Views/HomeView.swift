//
//  HomeView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 1/23/2026.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var questionStore = QuestionStore()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 30) {
                    
                    HStack(alignment: .center,spacing: 30) {
                        Card(category: "simple", image: "simple", title: "Podstawowe", multipleCategory: false)
                        Card(category: "party", image: "party", title: "Imprezowe", multipleCategory: false)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    
                    HStack(alignment: .center,spacing: 30) {
                        Card(category: "cienie", image: "ghost", title: "Cienie", multipleCategory: false)
                        Card(category: "wyznania", image: "door", title: "Wyznania", multipleCategory: false)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    
                    HStack(alignment: .center,spacing: 30) {
                        Card(category: "dlapar", image: "loveheart", title: "Dla par", multipleCategory: false)
                        Card(image: "skull", multipleCategory: true)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
                .padding()
            }
            .frame(width: 360)
            .navigationTitle(LocalizedStringKey("kategorie"))
            .navigationBarTitleDisplayMode(.automatic)

        }
    }
}

#Preview {
    HomeView()
}
