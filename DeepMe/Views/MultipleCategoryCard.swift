//
//  MultipleCategoryCard.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 24/12/2024.
//

import SwiftUI

struct MultipleCategoryCard: View {
    @EnvironmentObject var questionStore: QuestionStore
    
    @State var listOfCategory: [String]
    
    var questions: [Question] {
        //questionStore.questions.sorted { $0.id < $1.id }
        questionStore.questions.filter { listOfCategory.contains($0.category)}
    }
    
    @State private var currentIndex: Int = 0
    
    @State private var questionId: Int = 0
    
    @State private var previousQuestionTap: Bool = false
    
    @State private var questionList: [Int] = []
    
    var currentTitle: String {
        switch questions[currentIndex].category {
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
                .foregroundStyle(questions[currentIndex].category == "simple" ? Color.black : Color.white)
                
            
            if questions[currentIndex].subtitle != "" {
                Text(questions[currentIndex].subtitle ?? "")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(questions[currentIndex].category == "simple" ? Color.black : Color.white)
                    .padding(20)
            }
            Spacer()
        }
        .onAppear {
            if !questions.isEmpty {
                currentIndex = Int.random(in: 0..<questions.count)
                questionList.append(currentIndex)
                print("Question list: \(questionList)")
                print("Current index is: \(currentIndex)")
            }
        }
        .navigationTitle(currentTitle)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color("\(questions[currentIndex].backgroundColor)"))
        /*.onTapGesture(count: 1,perform: {
            nextQuestion()
        })
        .onTapGesture(count: 2, perform: {
            previousQuestion()
        })*/
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
        
        if questionList.count == questions.count {
            if previousQuestionTap {
                questionId += 1
                currentIndex = questionList[questionId]
                
                if questionId == questionList.count - 1 {
                    previousQuestionTap = false
                }
            } else {
                let lastQuestion = questionList.last!
                currentIndex = lastQuestion
            }
        } else {
            if previousQuestionTap {
                questionId += 1
                currentIndex = questionList[questionId]
                print("Question list: \(questionList)")
                print("Current index is: \(currentIndex)")
                if questionId == questionList.count - 1 {
                    previousQuestionTap = false
                }
            } else {
                currentIndex = Int.random(in: 0..<questions.count)
                
                if questionList.contains(currentIndex)  {
                    nextQuestion()
                } else {
                    questionList.append(currentIndex)
                    print("Question list: \(questionList)")
                    questionId += 1
                    print("Current index is: \(currentIndex)")
                }
            }
        }
    }
    
    private func previousQuestion() {
        previousQuestionTap = true
        print("Previous question")
        
        if questionId != 0 {
            currentIndex = questionList[questionId - 1]
            print("Current index is: \(currentIndex)")
            questionId -= 1
        }
    }
    
}

#Preview {
    MultipleCategoryCard(listOfCategory: ["dlapar","wyznania"])
        .environmentObject(QuestionStore())
}
