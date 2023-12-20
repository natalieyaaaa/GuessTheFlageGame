//
//  StartViewModel.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 22.11.2023.
//

import Foundation
import SwiftUI

class StartViewModel: ObservableObject {
    
    @AppStorage("name") var name: String = UserDefaults.standard.string(forKey: "username") ?? ""
    @AppStorage("age") var age: String = UserDefaults.standard.string(forKey: "age") ?? ""
    @State var startGame = false
     @State var showLogIn = false
     @State var showUserInfo = false
     
}
