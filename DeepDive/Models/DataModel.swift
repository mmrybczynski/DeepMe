//
//  DataModel.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import Foundation
import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let subtitle: String?
    let themeColor: Color
    let category: String
    let image: String
    let backgroundColor: Color
}


class QuestionStore: ObservableObject {
    @Published var questions: [Question] = [
        Question(text: "Gdybys miat/miata mozliwość dowiedziec sie prawdy na dowolny temat, jaki by to był?",subtitle: "Co z tymi wszystkimi zaginionymi skarpetami?" ,themeColor: Color.pink, category: "rozgrzewka", image: "skull", backgroundColor: .red.opacity(0.5)),
        Question(text: "Gdybys miat/miata mozliwość rozmowy z dowolna postacia historyczna, kogo bys wybrał/wybrała i jakie pytanie bys zadał/zadała?",subtitle: "Wyobraz sobie, że masz wehikuł czasu" ,themeColor: Color.pink, category: "rozgrzewka", image: "brain", backgroundColor: .red.opacity(0.5)),
        Question(text: "Gdybys mógł/mogła doświadczyć zycia w jakiejkolwiek ksiazce lub filmie, które bys wybrat/wybrata i dlaczego?",subtitle: "Stanley Kubrick c z y Tarantino?" ,themeColor: Color.pink, category: "rozgrzewka", image: "brain", backgroundColor: .red.opacity(0.5))
        
    ]
}
