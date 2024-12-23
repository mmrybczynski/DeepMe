//
//  ContentView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var questions: [Question] = [
        Question(text: "Co to jest SwiftUI?", themeColor: "black", category: "rozrywka"),
        Question(text: "Testowe pytanie?", themeColor: "red", category: "rozrywka")
        ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(questions[currentIndex].text)
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
    ContentView()
}
