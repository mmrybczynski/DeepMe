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
               NavigationLink(destination: OneCategoryCard(category: "rozrywka").environmentObject(questionStore), label: {
                   HStack{
                       Image("skull")
                           .resizable()
                           .frame(width: 20, height: 20)
                           .cornerRadius(5)
                       Text("Rozrywka")
                   }
               })
               NavigationLink("Rozrywka") {
                   OneCategoryCard(category: "rozrywka")
                       .environmentObject(questionStore)
               }
               NavigationLink("Nauka") {
                   OneCategoryCard(category: "nauka")
                       .environmentObject(questionStore)
               }
               NavigationLink("Losowa") {
                   MultipleCategoryCard()
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
