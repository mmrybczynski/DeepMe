//
//  SplashBackgroundView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 1/23/2026.
//

import SwiftUI

struct SplashBackgroundView: View {
    @State private var animateShape1 = false
    @State private var animateShape2 = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Tło
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue,
                        Color.blue.opacity(0.8),
                        Color.teal.opacity(0.6),
                        Color.purple.opacity(0.4)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // Koło 1 - Większe, wolniejsze
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 200, height: 200)
                    .blur(radius: 20)
                    .offset(
                        x: animateShape1 ? -geometry.size.width / 3 : geometry.size.width / 3,
                        y: animateShape1 ? -geometry.size.height / 4 : geometry.size.height / 4
                    )
                    .animation(
                        Animation.easeInOut(duration: 7)
                            .repeatForever(autoreverses: true),
                        value: animateShape1
                    )
                
                Circle()
                    .fill(Color.purple.opacity(0.4))
                    .frame(width: 150, height: 150)
                    .blur(radius: 10)
                    .offset(
                        x: animateShape2 ? geometry.size.width / 4 : -geometry.size.width / 4,
                        y: animateShape2 ? geometry.size.height / 3 : -geometry.size.height / 5
                    )
                    .animation(
                        Animation.easeInOut(duration: 5).delay(0.5)
                            .repeatForever(autoreverses: true),
                        value: animateShape2
                    )
            }
            .onAppear {
                animateShape1.toggle()
                animateShape2.toggle()
            }
        }
    }
}

#Preview {
    SplashBackgroundView()
}
