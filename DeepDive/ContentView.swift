//
//  ContentView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
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
    }
    
    private func previousQuestion() {
        print("Previous question")
    }
}

#Preview {
    ContentView()
}
