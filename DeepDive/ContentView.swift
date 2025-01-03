//
//  ContentView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var questionStore = QuestionStore()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 30) {
                    HStack(alignment: .center,spacing: 30) {
                        
                        Card(category: "rozgrzewka", image: "brain", title: "Rozgrzewka", multipleCategory: false)
                            .environmentObject(questionStore)
                            
                        
                        Card(category: "wyznania", image: "door", title: "Wyznania", multipleCategory: false)
                            .environmentObject(questionStore)
                    
                    }
                    
                    
                    HStack(alignment: .center,spacing: 30) {
                        Card(category: "cienie", image: "ghost", title: "Cienie", multipleCategory: false)
                            .environmentObject(questionStore)
                        
                        Card(image: "skull", multipleCategory: true)
                            .environmentObject(questionStore)
                        
                        
                        
                    }
                    
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width)
            .navigationTitle("Kategorie")
            .navigationBarTitleDisplayMode(.automatic)
            
            
           
           
       }
    }
}

#Preview {
    ContentView()
}
