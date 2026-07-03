//
//  UpdateBanner.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 7/2/2026.
//

import SwiftUI

struct UpdateBanner: View {
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        HStack {
            Image("AppIconToBaner")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(20)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading){
                Text("DeepMe")
                    .fontWeight(.bold)
                Text("Dostępna nowa wersja")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.gray)
                
            }
            
            Spacer()
            
            Button {
                Task {
                    if let url = URL(string: "https://apps.apple.com/pl/app/deepme/id6741001876") {
                        openURL(url)
                    }
                }
            } label: {
                Text("Zaktualizuj")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 14))
            }
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(20)
        .padding()
        
    }
}

#Preview {
    UpdateBanner()
}
