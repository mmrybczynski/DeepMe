//
//  CategoryModel.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 31/01/2025.
//

import Foundation

struct CategoryOption: Identifiable, Hashable {
    let id = UUID()
    let key: String
    let displayName: String
}

class CategoryStore: ObservableObject {
    @Published var category: [CategoryOption] = [
        CategoryOption(key: "simple",   displayName: "Podstawowe"),
        CategoryOption(key: "party",    displayName: "Imprezowe"),
        CategoryOption(key: "cienie",   displayName: "Cienie"),
        CategoryOption(key: "dlapar",   displayName: "Dla par"),
        CategoryOption(key: "wyznania", displayName: "Wyznania"),
        CategoryOption(key: "wyzwania", displayName: "Wyzwania")
    ]
}
