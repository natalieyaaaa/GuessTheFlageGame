//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 21.11.2023.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var vm = LogInViewModel()
    @FocusState var first
    @FocusState var second
    var body: some View {
        
        ZStack {
            
            Color(.mainPurple)
                .ignoresSafeArea()
            
            Circle()
                .foregroundColor(.subPurple)
                .frame(width: 500)
                .offset(x: -150, y: -190)
            
            VStack {
                Spacer()
                Spacer()
                
                Text("Log In")
                    .font(.system(size: 40, design: .rounded))
                    .fontWeight(.heavy)
                    .frame(height: 50)
                    .foregroundColor(.white)
                
                Text("Create an account")
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                
                VStack {
                    TextField("Username", text: $vm.usernameTF)
                        .textFieldCheck(textEmpty: vm.usernameTF.isEmpty)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.mainPurple.opacity(0.3))
                        )
                        .focused($first)
                        .padding()
                    
                    
                    
                    TextField("Age", text: $vm.ageTF)
                        .textFieldCheck(textEmpty: vm.ageTF.isEmpty, ageOverHundred: vm.ageOverH)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.mainPurple.opacity(0.3))
                        )
                        .keyboardType(.numberPad)
                        .focused($second)
                    if !first && !second {
                        Button {
                            performHapticFeedback(style: .medium)
                            vm.LogInButton()
                        } label: {
                            Image(systemName: "arrow.forward.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .foregroundColor(vm.isButtonDisabled ? .gray : .buttonPurple)
                        }.padding()
                            .disabled(vm.isButtonDisabled)
                            .transition(.opacity)
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal, 50)
                .padding(.vertical)
                .padding(.bottom, 50)
               
                Spacer()
            }
            .padding()
            .animation(.easeInOut, value: vm.ageTF)
            .animation(.easeInOut, value: vm.usernameTF)
            .animation(.easeOut, value: first)
            .animation(.easeOut, value: second)
        }.onTapGesture {
            hideKeyboard()
        }
        
    }
    
}

#Preview {
    LogInView()
        .environmentObject(LogInViewModel())

}

func UsernameTF() {
    
}
