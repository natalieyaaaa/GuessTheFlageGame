//
//  GameView.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 22.11.2023.
//

import Foundation
import SwiftUI

struct GameView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = GameViewModel()
   
    var body: some View {
        
        ZStack {
            
            Color(.bgPurple)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    performHapticFeedback(style: .light)
                    dismiss()
                } label: {
                  CloseButton()
                } .buttonBackground(isCircle: true)
                    .frame(maxWidth: .infinity, alignment: .topLeading)

                
                Spacer()
                
                if let answer = vm.isRight {
                    Text(answer ? "Correct!": "Wrong, it's \(vm.randomCountry)")
                        .font(.system(size: 25, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(answer ? .green: .red)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .transition(.opacity)
                        .onAppear {
                            triggerErrorVibration(success: answer)
                        }
                } else {
                    Text("Choose the right country!")
                        .font(.system(size: 25, design: .rounded))
                        .fontWeight(.heavy)
                        .frame(height: 30)
                        .foregroundColor(.white)
                        .padding()
                        .background(.mainPurple)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .transition(.opacity)
                }
                
                Text("Score: \(vm.score)")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.heavy)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.mainPurple.opacity(0.5)))
                    .shadow(radius: 1)

                
                Spacer()
                
                Image(vm.randomCountry)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 190)
                    .cornerRadius(20)
                    .padding(10)
                    .shadow(radius: 5)
                
                Spacer()
                
                ForEach(vm.buttons.sorted(), id: \.self) { item in
                    
                    Button {
                        vm.validate(item: item)} label: {
                            Text(item)
                                .padding()
                                .font(.system(size: 20, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(.subPurple.opacity(0.7))
                                .frame(width: 230, height: 50)
                                .background(.yellow)
                                .cornerRadius(20)
                        
                    }.padding(5)
                        .background(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 2))
                        .foregroundColor(.mainPurple.opacity(0.3))
                        .shadow(radius: 3)
                        .padding(.vertical, 5)
                        .disabled(vm.isRight != nil)
                }
                
                Spacer()
            }
            
        }.onAppear {
            vm.getRandomCountry()
            vm.getet()
        }
        .animation(.easeInOut, value: vm.buttons)
        .animation(.easeInOut, value: vm.isRight)
    }
}

#Preview {
    GameView()
}


