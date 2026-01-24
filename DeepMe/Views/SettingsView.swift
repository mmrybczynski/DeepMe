//
//  LanguageSettingsView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 1/22/2026.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var languageManager = LanguageManager.shared
    
    private let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
    
    @Binding var hasLaunchedBefore: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                Text(LocalizedStringKey("selectedLanguage"))
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Picker("Język aplikacji", selection: Binding(
                    get: { languageManager.currentLanguage },
                    set: { languageManager.currentLanguage = $0 }
                )) {
                    ForEach(languageManager.availableLanguages, id: \.self) { code in
                        Text(languageManager.displayName(for: code).capitalized)
                            .tag(code)
                    }
                }
                .pickerStyle(.menu)
                .tint(.blue)
                
            }
            Divider()
            HStack {
                Text(LocalizedStringKey("ekranPowitalny"))
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Button {
                    hasLaunchedBefore.toggle()
                } label: {
                    Text(LocalizedStringKey("erkanPowitalnyButton"))
                }
                .buttonStyle(.bordered)
                .tint(.blue)

                
            }
            
            Spacer()
            
            Text("\(version) v")
                .font(.system(size: 12, weight: .light))
                .padding(.bottom,2)
            
            Button(action: {
                UIApplication.shared.open(URL(string: "https://www.m-rybczynski.com/deepme")!)
            }) {
                Text("politykaPrywatnosci")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .light))
            }

        }
        .padding()
        
    }
}

#Preview {
    SettingsView(hasLaunchedBefore: .constant(false))
}
