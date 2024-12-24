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
            Image(filteredQuestions[currentIndex].image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(20) // Ustal promień zaokrąglenia rogów
                .shadow(color: filteredQuestions[currentIndex].themeColor, radius: 10, x: 0, y: 5)

            Text(filteredQuestions[currentIndex].text)
                .font(.system(size: 35,weight: .bold))
                .padding(30)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(filteredQuestions[currentIndex].backgroundColor)
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
