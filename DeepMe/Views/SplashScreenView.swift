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
                    Text("Jakie jest Twoje ulubione wspomnienie z dzieciństwa?")
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        
                    Spacer()
                }
                .background(Color("simple"))
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
                
                Text("Wybierz kategorię")
                    .font(.system(size: labelNumber == 0 ? 28 : 14))
                    .fontWeight(labelNumber == 0 ? .bold : .regular)
                    .animation(.easeInOut, value:labelNumber)
                
                Text("Zadawaj pytania")
                    .font(.system(size: labelNumber == 1 ? 28 : 14))
                    .fontWeight(labelNumber == 1 ? .bold : .regular)
                    .opacity(labelNumber >= 1 ? 1 : 0)
                    .animation(.easeInOut, value:labelNumber)
                
                Text("Graj")
                    .font(.system(size: labelNumber == 2 ? 28 : 14))
                    .fontWeight(labelNumber == 2 ? .bold : .regular)
                    .opacity(labelNumber >= 2 ? 1 : 0)
                    .animation(.easeInOut, value:labelNumber)
                
                Spacer()
                
                Text(labelNumber == 2 ? "Graj!" : "Dalej")
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
