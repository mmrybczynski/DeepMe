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
    let themeColor: String
    let category: String
    let image: String
    let backgroundColor: String
}


class QuestionStore: ObservableObject {
    @Published var questions: [Question] = [
        Question(text: "Gdybyś miał/miała mozliwość dowiedzieć się prawdy na dowolny temat, jaki by to był?",subtitle: "Co z tymi wszystkimi zaginionymi skarpetami?" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Gdybyś miał/miała mozliwość rozmowy z\u{00A0}dowolną postacią historyczną, kogo byś wybrał/wybrała i\u{00A0}jakie pytanie byś zadał/zadała?",subtitle: "Wyobraź sobie, że\u{00A0}masz wehikuł czasu" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Gdybyś mógł/mogła doświadczyć zycia w\u{00A0}jakiejkolwiek ksiazce lub filmie, które bys wybrat/wybrata i\u{00A0}dlaczego?",subtitle: "Stanley Kubrick c z y Tarantino?" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple")
        
    ]
}
