//
//  ContentView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var questionStore = QuestionStore()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: OneCategoryCard(category: "rozgrzewka").environmentObject(questionStore), label: {
                        VStack{
                            Image("brain")
                                .resizable()
                                .frame(width: 160, height: 90)
                            Text("Rozgrzewka")
                                .foregroundColor(.black)
                        }
                        .frame(width: 160, height: 120, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black, radius: 10, x: 0, y: 5)
                        .padding()
                        
                    })
                    
                    
                    NavigationLink(destination: OneCategoryCard(category: "wyznania").environmentObject(questionStore), label: {
                        VStack{
                            Image("door")
                                .resizable()
                                .frame(width: 160, height: 90)
                            Text("Wyznania")
                                .foregroundColor(.black)
                        }
                        .frame(width: 160, height: 120, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black, radius: 10, x: 0, y: 5)
                        .padding()
                        
                    })
                    
                    Spacer()
                }
                
                
                HStack {
                    Spacer()
                
                    NavigationLink(destination: MultipleCategoryCard().environmentObject(questionStore), label: {
                        VStack{
                            Image("skull")
                                .resizable()
                                .frame(width: 160, height: 90)
                            Text("Losowe")
                                .foregroundColor(.black)
                        }
                        .frame(width: 160, height: 120, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black, radius: 10, x: 0, y: 5)
                        .padding()
                    })
                    
                    Spacer()
                }
                
                Spacer()
            }
           .navigationTitle("Kategorie")
           .navigationBarTitleDisplayMode(.automatic)
           
       }
    }
}

#Preview {
    ContentView()
}
