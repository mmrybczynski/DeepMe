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
        Question(text: "Gdybys miał/miała możliwość dowiedzieć się prawdy na dowolny temat, jaki by to był?",subtitle: "Co z tymi wszystkimi zaginionymi skarpetami?" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Gdybys miał/miała możliwość rozmowy z dowolna postacią historyczna, kogo byś wybrał/wybrała i jakie pytanie byś zadał/zadała?",subtitle: "Wyobraź sobie, że masa wehikuł czasu" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Gdybys mógł/mogła doświadczyć życia w jakiejkolwiek książce lub filmie, które byś wybrał/wybrała i dlaczego?",subtitle: "Stanley Kubrick czy Tarantino?" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Jak myślisz, co jest najcenniejsza rzeczą, która ludzie mogą ofiarować sobie nawzajem?",subtitle: "Czteropak Piasta i paczka szlugów nie wchodzi w grę" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Co, twoim zdaniem ludzie zauważają u ciebie jako pierwsze?",subtitle: "Pomyśl o czymś co jest w tobie najlepsze" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Gdybyś miał/miała możliwość zobaczenia przyszłości, ale tylko przez pięć minut, co byś chciał/chciała zobaczyć?",subtitle: "To tylko 5 minut a może zmienić tak wiele" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Co w życiu cenisz najbardziej?",subtitle: "Mogą być to nawet frytki z Mc'Donalds" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Co prostego sprawia, że się uśmiechasz?",subtitle: "Żyj tak, by twój trup uśmiechał się w trumnie!" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Czego ostatnio nauczyło Cie życie?",subtitle: "Jak obliczyć pole trójkąta się nie liczy" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Jaka najbardziej niekonwencjonalna rzecz może Cię do kogoś przyciągnąć?",subtitle: "Rozmowy o pogodzie w windzie - nie ma nic bardziej elektryzującego" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Gdybyś mógł/mogła spędzić jeden dzień jako osoba z przeciwną płcią, co najbardziej chciałabyś/chciałbyś zrobić lub dowiedzieć się?",subtitle: "Panowie, Serio?" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Jaką supermoce chciałbyś/chciałabyś posiadać?",subtitle: "Nieograniczoną zdolność do unikania pytania. To byłaby dopiero moc" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple"),
        Question(text: "Jak myślisz, co jest największą zagadką wszechświata?",subtitle: "Jakie było hasło do Wi-Fi? To dopiero jest zagadka" ,themeColor: "Black", category: "rozgrzewka", image: "brain", backgroundColor: "Purple")
        
    ]
}
