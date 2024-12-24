//
//  MultipleCategoryCard.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 24/12/2024.
//

import SwiftUI

struct MultipleCategoryCard: View {
    @EnvironmentObject var questionStore: QuestionStore
    
    var questions: [Question] {
        questionStore.questions.sorted { $0.id < $1.id }
    }
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            Text(questions[currentIndex].text)
        }
        .navigationTitle(questions[currentIndex].category)
        .navigationBarTitleDisplayMode(.inline)
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
        if currentIndex < questions.count - 1 {
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
    MultipleCategoryCard()
        .environmentObject(QuestionStore())
}
