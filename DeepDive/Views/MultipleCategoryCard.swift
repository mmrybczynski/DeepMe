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
    
    @State private var currentIndex: Int = 0
    @State private var previousIndex: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            Image(questions[currentIndex].image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(20) // Ustal promień zaokrąglenia rogów
                .shadow(color: Color("\(questions[currentIndex].themeColor)"), radius: 10, x: 0, y: 5)

            Text(questions[currentIndex].text)
                .multilineTextAlignment(.center)
                .font(.system(size: 25,weight: .bold))
                .padding(20)
                .foregroundStyle(Color.white)
                
            
            if questions[currentIndex].subtitle != "" {
                Text(questions[currentIndex].subtitle ?? "")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
            }
            Spacer()
        }
        .onAppear {
            if !questions.isEmpty {
                currentIndex = Int.random(in: 0..<questions.count)
                previousIndex = currentIndex
            }
        }
        .navigationTitle(questions[currentIndex].category)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color("\(questions[currentIndex].backgroundColor)"))
        .onTapGesture(count: 1,perform: {
            nextQuestion()
        })
        .onTapGesture(count: 2, perform: {
            previousQuestion()
        })
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
        currentIndex = Int.random(in: 0..<questions.count)
        if currentIndex == previousIndex {
            nextQuestion()
        }
    }
    
    private func previousQuestion() {
        print("Previous question")
        print("Next question \(previousIndex) \(currentIndex)")
        currentIndex = previousIndex
    }
    
}

#Preview {
    MultipleCategoryCard()
        .environmentObject(QuestionStore())
}
