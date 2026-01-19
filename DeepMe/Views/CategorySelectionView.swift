//
//  CategorySelectionView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 31/01/2025.
//

import SwiftUI

struct CategorySelectionView: View {
    // Pozwoli nam zamknąć widok po dokonaniu wyboru
    //@Environment(\.presentationMode) var presentationMode
    @StateObject var categoryStore = CategoryStore()
    
    @EnvironmentObject var questionStore: QuestionStore
    
    // Zbiór wybranych kategorii
    @State private var selectedCategories: [String] = []
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                ForEach(categoryStore.category) { cat in

                    MultipleSelectionRow(category: LocalizedStringKey(cat.displayName), isSelected: selectedCategories.contains(cat.key) ? true : false, key: cat.key) {
                        if selectedCategories.contains(cat.key) {
                            selectedCategories.removeAll { $0 == cat.key }
                        } else {
                            selectedCategories.append(cat.key)
                        }
                        print(selectedCategories)
                    }
                }

                NavigationLink(
                    destination: MultipleCategoryCard(listOfCategory: selectedCategories).environmentObject(QuestionStore()),
                    label: {
                        Text(LocalizedStringKey("dalej"))
                            .foregroundStyle(selectedCategories.count < 2 ? .gray : .blue)
                            .frame(width: 100, height: 34)
                            .font(.system(size: 18))
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 14))
                            .padding(.horizontal,20)
                            .padding(.vertical,5)
                    }
                )
                .disabled(selectedCategories.count < 2)
                    
                
            }
            .navigationTitle(LocalizedStringKey("wybierzKategorie"))
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
        }
        
        
        
    }
}


#Preview {
    CategorySelectionView()
        .environmentObject(QuestionStore())
}
