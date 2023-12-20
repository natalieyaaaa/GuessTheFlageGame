//
//  UserInfoView.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 24.11.2023.
//

import Foundation
import SwiftUI

struct UserInfoView: View {
    
    @Environment(\.dismiss) var dismiss

    @StateObject var vm = GameViewModel()
    @StateObject var svm = StartViewModel()
    @State var changeInfoSheet = false
    
    @Binding var showUserInfo: Bool
    
    var body: some View {
        
        ZStack{
            
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
                
                Image(systemName: "person.crop.square.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130)
                    .foregroundColor(.subPurple)
                    .shadow(radius: 5)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.mainPurple.opacity(0.5)))
                    .padding(.vertical)
                
               
                Text("Name: \(svm.name)")
                    .InfoFields()
                    
                Text("Age: \(svm.age)")
                    .InfoFields()
         
                Text("Record: \(vm.record)")
                    .InfoFields()
                
                Spacer()
             
                Button {
                    changeInfoSheet = true
                } label: {
                    Text("Change info")
                        .font(.title2)
                        .foregroundColor(.mainPurple)
                        .bold()
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                } .padding(5)
                    .background(RoundedRectangle(cornerRadius: 25.0)
                        .stroke(lineWidth: 2)
                        .opacity(0.4))
                    .shadow(radius: 3)
                    
                Spacer()
            }
        }
    }
}

#Preview {
    UserInfoView(showUserInfo: .constant(true))
}

struct ChangeInfoSheet : View {
    
    @Binding var changeInfoSheet: Bool
    @StateObject var lvm = LogInViewModel()
    
    var body: some View {
        
        VStack {
            
            TextField("New Username", text: $lvm.usernameTF)
            TextField("New Age", text: $lvm.ageTF)
            
        }
        
    }
}
