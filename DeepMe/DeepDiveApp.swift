//
//  DeepDiveApp.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI

@main
struct DeepDiveApp: App {
    @AppStorage("selectedLanguage") private var selectedLanguageCode: String?
    @StateObject private var router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environmentObject(router)
                .environment(\.locale, .init(identifier: activeLanguage))
                .id(activeLanguage)
        }
    }
    
    var activeLanguage: String {
        if let selected = selectedLanguageCode {
            return selected
        }
        let systemLang = Locale.current.language.languageCode?.identifier ?? "en"
        let available = Bundle.main.localizations
        return available.contains(systemLang) ? systemLang : (available.first ?? "en")
    }
}
