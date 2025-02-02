//
//  MultipleSelectionRow.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 31/01/2025.
//

import SwiftUI

struct MultipleSelectionRow: View {
    let category: String
    let isSelected: Bool
    let key: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            // Możesz wyświetlić klucz i nazwę, lub tylko displayName
            Text(category)
                .foregroundColor(.primary)
            
            Spacer()
            
            // Ikona checkmark, jeśli wiersz jest wybrany
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        .frame(width: .infinity, height: 44)
        .padding(.horizontal)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal,20)
        .padding(.vertical,5)
        .contentShape(Rectangle()) // Dzięki temu można klikać w cały obszar
        .onTapGesture {
            action()
        }
    }
}


#Preview {
    MultipleSelectionRow(
        category: "Dla par",
        isSelected: true,
        key: "dlapar",
        action: {
            print("Tapped row in preview")
        }
    )
}
