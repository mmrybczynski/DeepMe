//
//  SuggestedView.swift
//  DeepDive
//
//  Created by Mateusz Rybczyński on 03/01/2025.
//

import SwiftUI

struct SuggestView: View {
    @ObservedObject var settingsModel: SettingsModel
    
    @State var question: String = ""
    @State var description: String = ""
    @State var category: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    print("done")
                    settingsModel.showSuggestView.toggle()
                },label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .foregroundStyle(Color.black)
                        .frame(width: 30, height: 30)
                })
                
            }
            .padding()
            TextField("Question", text: $question)
                .padding()
                .background(Color.white)
                .shadow(color: Color.black, radius: 5)
                .cornerRadius(10)
                .padding(.horizontal)
                
            TextField("Description", text: $description)
                .padding()
                .background(Color.white)
                .shadow(color: Color.black, radius: 5)
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextField("Category", text: $category)
                .padding()
                .background(Color.white)
                .shadow(color: Color.black, radius: 5)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                print("Submit")
            },label: {
                Text("Submit")
                    .foregroundStyle(Color.black)
            })
        }
    }
}

#Preview {
    SuggestView(settingsModel: SettingsModel())
}
