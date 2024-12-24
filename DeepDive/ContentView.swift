//
//  ContentView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var questionStore = QuestionStore()
    var body: some View {
        NavigationView {
           List {
               NavigationLink("Rozrywka") {
                   OneCategoryCard(category: "rozrywka")
                       .environmentObject(questionStore)
               }
               NavigationLink("Nauka") {
                   OneCategoryCard(category: "nauka")
                       .environmentObject(questionStore)
               }
           }
           .navigationTitle("Kategorie")
       }
    }
}

#Preview {
    ContentView()
}
