//
//  Card.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 29/12/2024.
//

import SwiftUI
import CoreImage

struct Card: View {
    @State var category: String?
    @StateObject private var questionStore = QuestionStore()
    @State var image: String
    @State var title: String?
    @State var multipleCategory: Bool
    
    var body: some View {
        NavigationLink(destination: multipleCategory == true ? AnyView(CategorySelectionView().environmentObject(questionStore)) : AnyView(OneCategoryCard(category: category ?? "").environmentObject(questionStore)), label: {
            ZStack(alignment: .bottom) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                
                Text((multipleCategory == true ? "Losowe" : title) ?? "")
                    .foregroundColor(.black)
                    .frame(width: 160, height: 50)
                    .background(.white)
            }
            .frame(width: 160, height: 160, alignment: .top)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: multipleCategory ? Color("GoldColor") : Color.black, radius: 10, x: 0, y: 0)
            
        })
        
    }
}

#Preview {
    Card(category: "rozgrzewka", image: "brain", title: "Rozgrzewka", multipleCategory: false)
}
