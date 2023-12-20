//
//  Extensions.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 27.11.2023.
//

import Foundation
import SwiftUI

extension View {
    func InfoFields() -> some View {
        self
            .foregroundColor(.white)
            .font(.system(size: 20, design: .rounded))
            .fontWeight(.heavy)
            .frame(width: 180)
            .padding()
            .background(.mainPurple)
            .cornerRadius(20)
            .shadow(radius: 3)
    }
    
    func textFieldCheck(textEmpty: Bool = true, ageOverHundred: Bool = false) -> some View {
       self
            .padding()
            .background(textEmpty ? .gray.opacity(0.4): ageOverHundred ? .red.opacity(0.4) :  .green.opacity(0.4))
            .cornerRadius(15)
            .frame(width: 300)
    }
    
    func CloseButton() -> some View {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .foregroundColor(.mainPurple)
    }
    
    func hideKeyboard() {
           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
       }
   
   func triggerErrorVibration(success: Bool) {
           let generator = UINotificationFeedbackGenerator()
       generator.notificationOccurred(success ? .success: .error)
       }
   
   func performHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
           let generator = UIImpactFeedbackGenerator(style: style)
           generator.prepare()
           generator.impactOccurred()
       }
    
    func buttonBackground(isCircle: Bool) -> some View {
        self
            .padding(.horizontal)
            .padding(5)
            .background(
                Group {
                    if isCircle {
                        Circle()
                            .stroke(lineWidth: 2)
                    } else {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 2)
                    }
                }
                .foregroundColor(.mainPurple.opacity(0.5))
            )
            .shadow(radius: 2)
    }
    
    
}



