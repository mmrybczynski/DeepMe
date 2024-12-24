//
//  DataModel.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import Foundation
import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let themeColor: Color
    let category: String
}


class QuestionStore: ObservableObject {
    @Published var questions: [Question] = [
        Question(text: "Co to jest SwiftUI?", themeColor: .black, category: "rozrywka"),
        Question(text: "Testowe pytanie?", themeColor: .red, category: "rozrywka"),
        Question(text: "Jak działa Combine?", themeColor: .blue, category: "nauka"),
        Question(text: "Czym jest MVVM?", themeColor: .green, category: "nauka")
    ]
}
