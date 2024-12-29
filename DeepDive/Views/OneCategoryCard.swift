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
                .foregroundStyle(Color.white)
                
            
            if filteredQuestions[currentIndex].subtitle != "" {
                Text(filteredQuestions[currentIndex].subtitle ?? "")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
            }
            Spacer()
        }
        .onAppear {
            if !filteredQuestions.isEmpty {
                currentIndex = Int.random(in: 0..<filteredQuestions.count)
                previousIndex = currentIndex
            }
        }
        .navigationTitle(filteredQuestions[currentIndex].category)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("\(filteredQuestions[currentIndex].backgroundColor)"))
        .ignoresSafeArea()
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
        currentIndex = Int.random(in: 0..<filteredQuestions.count)
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

extension View {
    func navigationBarColor(_ color: UIColor) -> some View {
        self.modifier(NavigationBarColorModifier(color: color))
    }
}

struct NavigationBarColorModifier: ViewModifier {
    var color: UIColor

    func body(content: Content) -> some View {
        content
            .onAppear {
                let coloredAppearance = UINavigationBarAppearance()
                coloredAppearance.configureWithOpaqueBackground()
                coloredAppearance.titleTextAttributes = [.foregroundColor: color]
                coloredAppearance.largeTitleTextAttributes = [.foregroundColor: color]

                UINavigationBar.appearance().standardAppearance = coloredAppearance
                UINavigationBar.appearance().compactAppearance = coloredAppearance
                UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
            }
    }
}

#Preview {
    OneCategoryCard(category: "rozgrzewka")
        .environmentObject(QuestionStore())
}
