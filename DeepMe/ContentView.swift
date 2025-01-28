//
//  ContentView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var questionStore = QuestionStore()
    @StateObject private var settingsModel = SettingsModel()
    
    private let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
        private let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "N/A"
    
    var body: some View {
        ZStack {
            if settingsModel.showSuggestView {
                SuggestView(settingsModel: settingsModel)
            } else {
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
                            
                            
                            VStack {
                                Text("Wersja \(version).\(build)")
                                    .font(.system(size: 12, weight: .light))
                                    .padding(.bottom,2)
                                
                                Button(action: {
                                    UIApplication.shared.open(URL(string: "https://www.m-rybczynski.com/deepme-polityka")!)
                                }) {
                                    Text("Polityka prywatności")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .light))
                                }
                            }
                            .padding(.top, 30)
                           
                                                        
                        }
                        .padding()
                        
                        
                    }
                    .frame(width: 360)
                    .navigationTitle("Kategorie")
                    .navigationBarTitleDisplayMode(.automatic)
                    
                   
                   
               }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
