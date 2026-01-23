//
//  ContentView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @StateObject private var questionStore = QuestionStore()
    
    private let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
    
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore = false
    
    var body: some View {
        
        if(hasLaunchedBefore) {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 30) {
                        
                        HStack(alignment: .center,spacing: 30) {
                            Card(category: "simple", image: "simple", title: "Podstawowe", multipleCategory: false)
                                .environmentObject(questionStore)
                            
                            Card(category: "party", image: "party", title: "Imprezowe", multipleCategory: false)
                                .environmentObject(questionStore)
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        HStack(alignment: .center,spacing: 30) {
                            
                            Card(category: "cienie", image: "ghost", title: "Cienie", multipleCategory: false)
                                .environmentObject(questionStore)
                                
                            
                            Card(category: "wyznania", image: "door", title: "Wyznania", multipleCategory: false)
                                .environmentObject(questionStore)
                        
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        HStack(alignment: .center,spacing: 30) {
                            Card(category: "dlapar", image: "loveheart", title: "Dla par", multipleCategory: false)
                                .environmentObject(questionStore)
                            
                            Card(image: "skull", multipleCategory: true)
                                .environmentObject(questionStore)
                        }
                        .frame(width: UIScreen.main.bounds.width)
                    }
                    .padding()
                }
                .frame(width: 360)
                .navigationTitle(LocalizedStringKey("kategorie"))
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 18))
                                .foregroundColor(.primary)
                                .accessibilityLabel("Ustawienia")
                        }
                    }
                }
    
            }
        } else {
            SplashScreenView(hasLaunchedBefore: $hasLaunchedBefore)
        }
        
            
    }
}

#Preview {
    ContentView()
}
