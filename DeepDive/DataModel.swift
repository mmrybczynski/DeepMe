//
//  DataModel.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let themeColor: String
    let category: String?
}
