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
        Question(text: "Jaki jest Twój największy kompleks?",subtitle: "Poznacie prawdę, a prawda was wyzwoli - Ewangelia Jana (8,32)",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Do jakiego uczucia wstydzisz się przyznać?",subtitle: "To co przykryte, wydaje się ciekawsze niż to, co na wierzchu",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Co u Ciebie? Bądź bardziej szczery/szczera niż zazwyczaj",subtitle: "Prosto w oczy, nie próbując kryć się za firanką rzęs albo postronnymi myślami. Mało kto ośmiela się tak robić. - Olga Grymk",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Co aktualnie dzieje się w twoim sercu i umyśle?",subtitle: "Dlaczego serce kocha tylko to, co może stracić? - Cornelia Funke",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Co aktualnie sprawia Ci w życiu największy problem?",subtitle: "Problemy odłożone na później mają to do siebie, że często same się rozwiązują - John Flanagan",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Jakie było twoje dzieciństwo i jak wygląda twoja relacja z rodzicami?",subtitle: "W dzieciństwie jadłem gluty, a po tacie pamiętam tylko ciepłą deskę.",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Coś, co wydarzyło się w czasach szkoły a co na prawdę miało wpływ na to kim jesteś dzisiaj?",subtitle: "I nie chodzi to to to, że ktoś ukradł Ci kanapki",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Gdybyś mogła/mógł przeżyć jeszcze raz jeden dzień swojego życia, który by to był i dlaczego?",subtitle: "Przeżyć jeszcze raz narodziny. To byłoby ciekawe",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        Question(text: "Czy jest coś co chciałbyś wybaczyć sobie lub komuś innemu?",subtitle: "Kochać siebie to początek dożywotniej miłości - Oscar Wilde",themeColor:"Black", category: "wyznania", image: "door", backgroundColor: "Wyznania"),
        /*--- Cienie ---*/
        Question(text: "Z jaką traumą borykasz się do dzisiaj?",subtitle: "Pamiętaj, nie jesteś sam/sama w tej walce",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Jaki był najniższy punkt twojego żęcia i czego się z tego nauczyłaś/nauczyłeś?",subtitle: "Każda porażka, to jakiś krok do sukcesu",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Jakich przeprosin nigdy nie udało Ci się dać",subtitle: "„Przeprosiny są zapachem, który kwiat zostawia na bucie, który go zmiażdżył.” - William Arthur Ward",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Jakiego zakończenia nigdy nie otrzymałaś/otrzymałeś?",subtitle: "Należy szukać zamknięcia w sobie, nie w innych.",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Gdybyś mógł/mogła przywrócić kogoś do swojego życia, kto by yo był i dlaczego?",subtitle: "Oby każda utracona więź przynosi nową perspektywę.",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Kiedy i dlaczego ostatni raz płakałaś/płakałeś?",subtitle: "Przyznaj się bez obaw, dzielenie się uczuciami to siła.",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Opisz swoje najgorsze wspomnienie",subtitle: "„Najgłębsze rany uczą nas największych prawda.” - Khalil Gibran",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Gdy wszyscy twoi byli partnerzy zostali zamknięci w jednym pokoju, co by o Tobie powiedzieli?",subtitle: "„Przeszłość jest miejscem odniesienia, a nie miejscem zamieszkania” - Roy T. Bennett",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Kiedy w życiu czułeś/czułaś się na prawdę samotny? Nawet wśród ludzi.",subtitle: "„Kochać, a potem utracić to, co kochamy - to wpisane jest w naszą naturę. Jeśli nie potrafimy znieść utraty, pochłonie nas zło.” - C.S. Lewis",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Co byś zrobił/zrobiła, gdybyś miał/miała pewność, że nikt się nie dowie.",subtitle: "Pewnie chciałbyś/chciałabyś coś ukraść? Wysil się trochę bardziej.",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Czy kiedykolwiek czułeś/czułaś nienawiść do kogoś bliskiego? Co było tego przyczyną?",subtitle: "Złość to tak samo ważne uczucie, jak każde inne.",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Czy kiedykolwiek miałeś wrażenie, że jesteś więźniem swojego własnego umysłu? JAkie to były okoliczności?",subtitle: "„Im dłużej żyjemy, tym dłuższy cień rzucają ściany naszego więzienia.” - Haruki Marakami",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Czy wierzysz, że ludzie są z natury dobrzy czy źli? Co wpłynęło na Twoje przekonanie?",subtitle: "„Im dłużej żyjemy, tym dłuższy cień rzucają ściany naszego więzienia.” - Haruki Marakami",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie"),
        Question(text: "Czy kiedykolwiek doświadczyłeś/doświadczyłaś zdrady? Jak to wpłynęło na Twoją zdolność do zaufania innym?",subtitle: "Mam nadzieję, że przy tych obok ciebie czujesz się bezpiecznie",themeColor:"Black", category: "cienie", image: "ghost", backgroundColor: "Cienie")
    ]
}
