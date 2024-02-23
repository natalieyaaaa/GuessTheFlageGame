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
    @Published var startGame = false
     @Published var showLogIn = false
     @Published var showUserInfo = false
     
}
