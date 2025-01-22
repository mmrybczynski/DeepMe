//
//  SettingsModel.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 03/01/2025.
//

import Foundation

class SettingsModel: ObservableObject {
    @Published var showDeepDiveLog: Bool = false
    @Published var showDeepDiveDebugLog: Bool = false
    @Published var showDeepDivePerformanceLog: Bool = false
    @Published var showDeepDiveMemoryLog: Bool = false
    @Published var showSuggestView: Bool = false
}
