//
//  LanguageManager.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 1/22/2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class LanguageManager: ObservableObject {
    static let shared = LanguageManager()

    private static let storageKey = "selectedLanguage"

    @Published var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: Self.storageKey)
        }
    }

    var availableLanguages: [String] {
        let langs = Bundle.main.localizations
            .filter { $0 != "Base" }

        let unique = Array(Set(langs)).sorted()

        if unique.contains("pl") {
            return ["pl"] + unique.filter { $0 != "pl" }
        } else {
            return unique
        }
    }

    private init() {
        // 1️⃣ język zapisany przez użytkownika
        if let stored = UserDefaults.standard.string(forKey: Self.storageKey),
           !stored.isEmpty {
            self.currentLanguage = stored
            return
        }

        // 2️⃣ język systemowy (jeśli wspierany)
        let system = Locale.current.language.languageCode?.identifier ?? "pl"
        let bundleLanguages = Bundle.main.localizations.filter { $0 != "Base" }

        if bundleLanguages.contains(system) {
            self.currentLanguage = system
            return
        }

        // 3️⃣ fallback – pierwszy dostępny język
        self.currentLanguage = bundleLanguages.first ?? "pl"
    }

    func displayName(for languageCode: String) -> String {
        let locale = Locale(identifier: languageCode)
        return locale.localizedString(forIdentifier: languageCode) ?? languageCode
    }
}
