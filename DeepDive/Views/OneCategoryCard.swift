//
//  OneCategoryCard.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 24/12/2024.
//

import SwiftUI

struct OneCategoryCard: View {
    @EnvironmentObject var questionStore: QuestionStore
    let category: String

    var filteredQuestions: [Question] {
        questionStore.questions.filter { $0.category == category }
    }
    @State private var currentIndex = 0
    var body: some View {
        VStack {
            Text(filteredQuestions[currentIndex].category)
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(filteredQuestions[currentIndex].themeColor)
            Spacer()
            Text(filteredQuestions[currentIndex].text)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < 0 { // Przeciągnięcie w lewo
                        nextQuestion()
                    } else if value.translation.width > 0 { // Przeciągnięcie w prawo
                        previousQuestion()
                    }
                }
        )
    }
    
    private func nextQuestion() {
        print("Next question")
        if currentIndex < filteredQuestions.count - 1 {
            currentIndex += 1
        }
    }
    
    private func previousQuestion() {
        print("Previous question")
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
}

#Preview {
    OneCategoryCard(category: "rozrywka")
        .environmentObject(QuestionStore())
}
