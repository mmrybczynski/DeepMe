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
    
    var body: some View {
        ZStack {
            if settingsModel.showSuggestView {
                SuggestView(settingsModel: settingsModel)
            } else {
                NavigationView {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .center, spacing: 30) {
                            
                            HStack(alignment: .center,spacing: 30) {
                                
                                Card(category: "cienie", image: "ghost", title: "Cienie", multipleCategory: false)
                                    .environmentObject(questionStore)
                                    
                                
                                Card(category: "wyznania", image: "door", title: "Wyznania", multipleCategory: false)
                                    .environmentObject(questionStore)
                            
                            }
                            .frame(width: UIScreen.main.bounds.width)
                            
                            HStack(alignment: .center,spacing: 30) {
                                
                                Card(category: "wyzwania", image: "strong", title: "Wyzwania", multipleCategory: false)
                                    .environmentObject(questionStore)
                                    
                                
                                Card(category: "party", image: "party", title: "Imprezowe", multipleCategory: false)
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
                            
                            
                            /*Button(action: {
                                settingsModel.showSuggestView.toggle()
                            }, label: {
                                Text("Zaproponuj pytanie")
                                    .frame(width: UIScreen.main.bounds.width / 2, height: 40)
                                    .foregroundStyle(Color.black)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                    .padding()
                                    
                            })*/
                            
                        }
                        .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width)
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
