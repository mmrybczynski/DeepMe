//
//  OneCategoryCard.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 24/12/2024.
//

import SwiftUI

struct OneCategoryCard: View {
    @EnvironmentObject var questionStore: QuestionStore
    
    @State private var currentIndex: Int = 0
    @State private var previousIndex: Int = 0
    let category: String
    
    var filteredQuestions: [Question] {
        questionStore.questions.filter { $0.category == category }
    }

    init(category: String) {
        self.category = category
    }
    
    
    
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
                .font(.system(size: 25,weight: .bold))
                .padding(20)
            
            if filteredQuestions[currentIndex].subtitle != "" {
                Text(filteredQuestions[currentIndex].subtitle ?? "")
                    .font(.system(size: 15))
            }
            Spacer()
        }
        .onAppear {
            if !filteredQuestions.isEmpty {
                currentIndex = Int.random(in: 0..<filteredQuestions.count)
                previousIndex = currentIndex
            }
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
        print("Next question \(previousIndex) \(currentIndex)")
        
        previousIndex = currentIndex
        currentIndex = Int.random(in: 0..<filteredQuestions.count)
    }
    
    private func previousQuestion() {
        print("Previous question")
        print("Next question \(previousIndex) \(currentIndex)")
        currentIndex = previousIndex
    }
}

#Preview {
    OneCategoryCard(category: "rozrywka")
        .environmentObject(QuestionStore())
}
