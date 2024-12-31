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
        /*--- Rozgrzewka ---*/
        Question(text: "Gdybys miał/miała możliwość dowiedzieć się prawdy na dowolny temat, jaki by to był?",subtitle: "Co z tymi wszystkimi zaginionymi skarpetami?",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Gdybys miał/miała możliwość rozmowy z dowolna postacią historyczna, kogo byś wybrał/wybrała i jakie pytanie byś zadał/zadała?",subtitle: "Wyobraź sobie, że masa wehikuł czasu",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Gdybys mógł/mogła doświadczyć życia w jakiejkolwiek książce lub filmie, które byś wybrał/wybrała i dlaczego?",subtitle: "Stanley Kubrick czy Tarantino?",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Jak myślisz, co jest najcenniejsza rzeczą, która ludzie mogą ofiarować sobie nawzajem?",subtitle: "Czteropak Piasta i paczka szlugów nie wchodzi w grę",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Co, twoim zdaniem ludzie zauważają u ciebie jako pierwsze?",subtitle: "Pomyśl o czymś co jest w tobie najlepsze",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Gdybyś miał/miała możliwość zobaczenia przyszłości, ale tylko przez pięć minut, co byś chciał/chciała zobaczyć?",subtitle: "To tylko 5 minut a może zmienić tak wiele",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Co w życiu cenisz najbardziej?",subtitle: "Mogą być to nawet frytki z Mc'Donalds",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Co prostego sprawia, że się uśmiechasz?",subtitle: "Żyj tak, by twój trup uśmiechał się w trumnie!",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Czego ostatnio nauczyło Cie życie?",subtitle: "Jak obliczyć pole trójkąta się nie liczy",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Jaka najbardziej niekonwencjonalna rzecz może Cię do kogoś przyciągnąć?",subtitle: "Rozmowy o pogodzie w windzie - nie ma nic bardziej elektryzującego",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Gdybyś mógł/mogła spędzić jeden dzień jako osoba z przeciwną płcią, co najbardziej chciałabyś/chciałbyś zrobić lub dowiedzieć się?",subtitle: "Panowie, Serio?",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Jaką supermoce chciałbyś/chciałabyś posiadać?",subtitle: "Nieograniczoną zdolność do unikania pytania. To byłaby dopiero moc",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        Question(text: "Jak myślisz, co jest największą zagadką wszechświata?",subtitle: "Jakie było hasło do Wi-Fi? To dopiero jest zagadka",themeColor:"Black", category: "rozgrzewka", image: "brain", backgroundColor: "Rozgrzewka"),
        /*--- Wyznania ---*/
        Question(text: "Opowiedz o swojej pasji o której nie mówisz nikomu.",subtitle: "Pamiętaj, że każdy z nas ma jakieś sekrety",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Co chciałbyś/chciałabyś, aby ludzie o Tobie wiedzieli?",subtitle: "Że jestem mistrze w ukrywaniu swojej niewiedzy za pomocą inteligentnie brzmiących słów.",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Jaki jest Twój największy kompleks?",subtitle: "Poznacie prawdę, a prawda was wyzwoli - Ewangelia Jana (8,,32)",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Do jakiego uczucia wstydzisz się przyznać?",subtitle: "To co przykryte, wydaje się ciekawsze niż to, co na wierzchu",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Co u Ciebie? Bądź bardziej szczery/szczera niż zazwyczaj",subtitle: "Prosto w oczy, nie próbując kryć się za firanką rzęs albo postronnymi myślami. Mało kto ośmiela się tak robić. - Olga Grymk",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Co aktualnie dzieje się w twoim sercu i umyśle?",subtitle: "Dlaczego serce kocha tylko to, co może stracić? - Cornelia Funke",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Co aktualnie sprawia Ci w życiu największy problem?",subtitle: "Problemy odłożone na później mają to do siebie, że często same się rozwiązują - John Flanagan",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Jakie było twoje dzieciństwo i jak wygląda twoja relacja z rodzicami?",subtitle: "W dzieciństwie jadłem gluty, a po tacie pamiętam tylko ciepłą deskę.",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Coś, co wydarzyło się w czasach szkoły a co na prawdę miało wpływ na to kim jesteś dzisiaj?",subtitle: "I nie chodzi to to to, że ktoś ukradł Ci kanapki",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Gdybyś mogła/mógł przeżyć jeszcze raz jeden dzień swojego życia, który by to był i dlaczego?",subtitle: "Przeżyć jeszcze raz narodzony. To byłoby ciekawe",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Czy jest coś co chciałbyś wybaczyć sobie lub komuś innemu?",subtitle: "Kochać siebie to początek dożywotniej miłości - Oscar Wilde",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania")
    ]
}
