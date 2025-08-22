//
//  SplashScreenView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 22/08/2025.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var labelNumber = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Text("Wybierz kategorię")
                .font(.system(size: labelNumber == 0 ? 28 : 14))
                .fontWeight(labelNumber == 0 ? .bold : .regular)
                .animation(.easeInOut, value:labelNumber)
            
            Text("Zadawaj pytania")
                .font(.system(size: labelNumber == 1 ? 28 : 14))
                .fontWeight(labelNumber == 1 ? .bold : .regular)
                .animation(.easeInOut, value:labelNumber)
            
            Text("Graj")
                .font(.system(size: labelNumber == 2 ? 28 : 14))
                .fontWeight(labelNumber == 2 ? .bold : .regular)
                .animation(.easeInOut, value:labelNumber)
            
            Spacer()
            
            Text("Dalej")
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .onTapGesture {
                    nextText()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    
    func nextText() {
        labelNumber += 1
    }
}

#Preview {
    SplashScreenView()
}
