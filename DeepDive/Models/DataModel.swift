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
}


class QuestionStore: ObservableObject {
    @Published var questions: [Question] = [
        Question(text: "Co to jest SwiftUI?", themeColor: .black, category: "rozrywka", image: "skull"),
        Question(text: "Czym jest MVVM?", themeColor: .green, category: "nauka", image: "vampire")
    ]
}
