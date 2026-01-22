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
                        
                        NavigationLink(destination: AnyView(SettingsView()), label: {
                            HStack {
                                Spacer()
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    
                            }
                            .foregroundColor(.simple)
                            .padding()
                        })
                    }
                    .padding()
                }
                .frame(width: 360)
                .navigationTitle(LocalizedStringKey("kategorie"))
                .navigationBarTitleDisplayMode(.automatic)
            }
        } else {
            SplashScreenView(hasLaunchedBefore: $hasLaunchedBefore)
        }
        
            
    }
}

#Preview {
    ContentView()
}
