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
    let image: String
    let backgroundColor: Color
}


class QuestionStore: ObservableObject {
    @Published var questions: [Question] = [
        Question(text: "Co to jest SwiftUI?", themeColor: .black, category: "rozrywka", image: "skull", backgroundColor: .black.opacity(0.5)),
        Question(text: "Czym jest MVVM?", themeColor: .green, category: "nauka", image: "vampire", backgroundColor: .green.opacity(0.5))
    ]
}
