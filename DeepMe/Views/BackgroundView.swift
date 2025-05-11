//
//  BackgroundView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 02/02/2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [
                Color.black.opacity(0.7),
                Color.red,
                Color.white
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundView()
}
