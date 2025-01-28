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
    @State private var questionId: Int = 0
    @State private var previousQuestionTap: Bool = false
    @State private var questionList: [Int] = []
    @State private var moveAvailable: Bool = false
    
    let category: String
    var filteredQuestions: [Question] {
        questionStore.questions.filter { $0.category == category }
    }
    init(category: String) {
        self.category = category
    }
    var currentTitle: String {
        switch filteredQuestions[currentIndex].category {
        case "simple":
            return "Podstawowe"
        case "party":
            return "Imprezowe"
        case "cienie":
            return "Cienie"
        case "dlapar":
            return "Dla par"
        case "wyznania":
            return "Wyznania"
        case "wyzwania":
            return "Wyzwania"
        default:
            return ""
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(filteredQuestions[currentIndex].image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(20) // Ustal promień zaokrąglenia rogów
                .shadow(color: Color("\(filteredQuestions[currentIndex].themeColor)"), radius: 10, x: 0, y: 5)

            Text(filteredQuestions[currentIndex].text)
                .multilineTextAlignment(.center)
                .font(.system(size: 25,weight: .bold))
                .padding(20)
                .foregroundStyle(filteredQuestions[currentIndex].category == "simple" ? Color.black : Color.white)
                
            
            if filteredQuestions[currentIndex].subtitle != "" {
                Text(filteredQuestions[currentIndex].subtitle ?? "")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(filteredQuestions[currentIndex].category == "simple" ? Color.black : Color.white)
                    .padding(.horizontal, 20)
            }
            Spacer()
        }
        .onAppear {
            if !filteredQuestions.isEmpty {
                currentIndex = Int.random(in: 0..<filteredQuestions.count)
                questionList.append(currentIndex)
                print("Question list: \(questionList)")
                print("Current index is: \(currentIndex)")
            }
        }
        .navigationTitle(currentTitle)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("\(filteredQuestions[currentIndex].backgroundColor)"))
        .ignoresSafeArea()
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
        /*.onTapGesture(count: 1, perform: {
            nextQuestion()
        })
        .onTapGesture(count: 2, perform: {
            previousQuestion()
        })*/
        
    }

    
    private func nextQuestion() {
        
        if filteredQuestions.count > 1 {
            if previousQuestionTap {
                questionId += 1
                currentIndex = questionList[questionId]
                print("Question list: \(questionList)")
                print("Current index is: \(currentIndex)")
                if questionId == questionList.count - 1 {
                    previousQuestionTap = false
                }
            } else {
                currentIndex = Int.random(in: 0..<filteredQuestions.count)
                
                if questionList.contains(currentIndex) {
                    nextQuestion()
                } else {
                    questionList.append(currentIndex)
                    print("Question list: \(questionList)")
                    questionId += 1
                    print("Current index is: \(currentIndex)")
                }
            }
        } else {
            print("Tylko jedno pytanie")
        }
    }
    
    private func previousQuestion() {
        previousQuestionTap = true
        print("Previous question")
        
        if questionId == 0 {
            currentIndex = questionList[questionId]
        } else {
            currentIndex = questionList[questionId - 1]
            print("Current index is: \(currentIndex)")
            questionId -= 1
        }
    }
    
}

#Preview {
    OneCategoryCard(category: "test")
        .environmentObject(QuestionStore())

}
