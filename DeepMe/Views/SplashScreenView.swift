//
//  SplashScreenView.swift
//  DeepMe
//
//  Created by Mateusz Rybczyński on 22/08/2025.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var labelNumber = 0
    @Binding var hasLaunchedBefore: Bool
    @State var height = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack {
            SplashBackgroundView()
            
            VStack{
                
                if(labelNumber == 0) {
                    HStack(spacing: 20){
                        
                        Card(category: "simple", image: "simple", title: "Podstawowe", multipleCategory: false)
                        
                        Card(category: "party", image: "party", title: "Imprezowe", multipleCategory: false)
                            
                    }
                    .frame(maxWidth: .infinity, maxHeight: height / 2)
                    .padding()
                }
                
                if(labelNumber == 1) {
                    VStack{
                        Spacer()
                        Text(LocalizedStringKey("mainQuestion"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            
                        Spacer()
                    }
                    .background(Color.blue.opacity(0.4))
                    .frame(maxWidth: .infinity, maxHeight: height / 2)
                }
                
                if(labelNumber == 2) {
                    VStack{
                        Spacer()
                        Text("Baw się dobrze!")
                            .font(.system(size: 25))
                            .padding()
                            .background(Color.blue)
                            .clipShape(.buttonBorder)
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                        .frame(maxWidth: .infinity, maxHeight: height / 2)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading){
                        Text(LocalizedStringKey("splashSelectCategories"))
                            .font(.system(size: labelNumber == 0 ? 28 : 16))
                            .fontWeight(labelNumber == 0 ? .bold : .regular)
                        Text(LocalizedStringKey("splashSelectCategoriesSub"))
                            .font(.system(size: labelNumber == 0 ? 20 : 14))
                    }
                    .animation(.easeInOut, value:labelNumber)
                    .foregroundStyle(labelNumber == 0 ? Color.black : Color.white)
                    
                    VStack(alignment: .leading) {
                        Text(LocalizedStringKey("splashAskQuestion"))
                            .font(.system(size: labelNumber == 1 ? 28 : 16))
                            .fontWeight(labelNumber == 1 ? .bold : .regular)
                            
                        Text(LocalizedStringKey("splashAskQuestionSub"))
                            .font(.system(size: labelNumber == 0 ? 20 : 14))
                    }
                    .opacity(labelNumber >= 1 ? 1 : 0)
                    .animation(.easeInOut, value:labelNumber)
                    .foregroundStyle(labelNumber == 1 ? Color.black : Color.white)
                    
                    
                    VStack(alignment: .leading) {
                        Text(LocalizedStringKey("splashPlay"))
                            .font(.system(size: labelNumber == 2 ? 28 : 16))
                            .fontWeight(labelNumber == 2 ? .bold : .regular)
                    }
                    .opacity(labelNumber >= 2 ? 1 : 0)
                    .animation(.easeInOut, value:labelNumber)
                    .foregroundStyle(labelNumber == 2 ? Color.black : Color.blue)
                    
                    Spacer()
                    
                    Text(labelNumber == 2 ? LocalizedStringKey("splashPlayButton") : LocalizedStringKey("Next"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .onTapGesture {
                            nextText()
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: height / 2)
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func nextText() {
        labelNumber += 1
        if labelNumber >= 3 {
            hasLaunchedBefore = true
        }
    }
}

#Preview {
    SplashScreenView(hasLaunchedBefore: .constant(false))
}
