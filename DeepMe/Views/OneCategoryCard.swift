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
    @State private var lastQuestionIndex: Bool = false
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
            
            HStack {
                Button {
                    previousQuestion()
                } label: {
                    Text("Poprzednie")
                        .padding()
                        .fontWeight(.bold)
                }
                .disabled(questionId == 0 ? true : false)
                
                Spacer()
                
                Button {
                    nextQuestion()
                } label: {
                    Text("Następne")
                        .padding()
                        .fontWeight(.bold)
                }
                .disabled(lastQuestionIndex == true ? true : false)

            }
            .padding()
        }
        .onAppear {
            if !filteredQuestions.isEmpty {
                currentIndex = Int.random(in: 0..<filteredQuestions.count)
                questionList.append(currentIndex)
            }
        }
        .navigationTitle(currentTitle)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("\(filteredQuestions[currentIndex].backgroundColor)"))
        .ignoresSafeArea()
    }

    
    private func nextQuestion() {
        
        if questionList.count == filteredQuestions.count{
            
            
            if previousQuestionTap {
                questionId += 1
                currentIndex = questionList[questionId]
                
                if questionId == questionList.count - 1 {
                    previousQuestionTap = false
                }
            } else {
                let lastQuestion = questionList.last!
                currentIndex = lastQuestion
                lastQuestionIndex = true
            }
        } else {
            print("-- dla testow")
            //zabezpieczenie przed tym jeśli lista pytań wczytałaby się jako jedno pytanie
            if filteredQuestions.count > 1 {
                
                //Sprawdzenie czy było wcześniej cofnięcie
                if previousQuestionTap {
                    //odczytanie następnego elementu z listy
                    questionId += 1
                    currentIndex = questionList[questionId]
                    //jeśli dojdziemy do pytania, które było ostatnio wygenerowane to zaczynamy generować nowe numery pytań
                    if questionId == questionList.count - 1 {
                        previousQuestionTap = false
                    }
                } else {
                    currentIndex = Int.random(in: 0..<filteredQuestions.count)
                    
                    //sprawdzenie czy aktualnie wygenerowana lista zawiera nowo wygenerowany numer ppytania
                    if questionList.contains(currentIndex) {
                        nextQuestion()
                    } else {
                        questionList.append(currentIndex)
                        questionId += 1
                    }
                }
            } else {
                print("Tylko jedno pytanie")
            }
        }
        
        if questionList.count == filteredQuestions.count && currentIndex == questionList.last{
            lastQuestionIndex = true
        }

    }
    
    private func previousQuestion() {
        previousQuestionTap = true
        lastQuestionIndex = false
        
        if questionId == 0 {
            currentIndex = questionList[0]
        } else {
            currentIndex = questionList[questionId - 1]
            questionId -= 1
        }
    }
    
}

#Preview {
    //OneCategoryCard(category: "test")
    //    .environmentObject(QuestionStore())
    ContentView()
}
