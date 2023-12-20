//
//  StartView.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 21.11.2023.
//

import SwiftUI

struct StartView: View {
    
    @StateObject var vm = LogInViewModel()
    @StateObject var svm = StartViewModel()
    @StateObject var gvm = GameViewModel()

    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color(.bgPurple)
                    .ignoresSafeArea()
                
                VStack {
                    
                    NavigationLink("",
                                   destination: GameView().navigationBarBackButtonHidden(),
                                   isActive: $svm.startGame)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text("Welcome back, \(vm.username)")
                                .foregroundColor(.buttonPurple)
                                .font(.title3)
                            
                            Text("Let's play!")
                                .font(.system(size: 40, design: .rounded))
                                .fontWeight(.heavy)
                                .frame(height: 30)
                                .foregroundColor(.buttonPurple)
                            
                        }.padding(25)
                            .padding(.leading, 15)
                            .background(RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.mainPurple.opacity(0.5))
                            ).offset(x: -15)
                        
                        Spacer()
                        Button {
                            svm.showUserInfo = true
                        } label: {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .foregroundColor(.mainPurple)
                        } .padding(5)
                            .background(Circle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.mainPurple.opacity(0.7)))
                            .shadow(radius: 5)
                        Spacer()
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button {
                        performHapticFeedback(style: .light)
                        svm.startGame.toggle()
                    } label: {
                        Text("Start the game!")
                            .padding()
                            .font(.title)
                            .bold()
                            .foregroundColor(.subPurple.opacity(0.7))
                            .background(.yellow)
                            .cornerRadius(20)
                    } .padding(5)
                        .background(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 2))
                        .foregroundColor(.mainPurple.opacity(0.4))
                        .shadow(radius: 8)
                    
                    Spacer()
                    
                    HStack {
                        
                        Image(systemName: "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .foregroundColor(.yellow)
                        
                        
                        VStack(alignment: .leading) {
                            Text("You're record is ")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            + Text ("\(gvm.record)")
                                .foregroundColor(.yellow)
                                .font(.system(size: 20))
                                .bold()
                            
                            Text("Try to get more!")
                                .font(.system(size: 30, design: .rounded))
                                .bold()
                                .foregroundColor(.white)
                            
                        }.padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.padding()
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.mainPurple)
                        )
                        .padding()
                }
            }
        }
        .fullScreenCover(isPresented: $svm.showUserInfo) {
            UserInfoView(showUserInfo: $svm.showUserInfo)
        }
    }
}

#Preview {
  StartView()

}
