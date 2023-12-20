//
//  ViewModel.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 21.11.2023.
//

import Foundation
import SwiftUI

class LogInViewModel: ObservableObject {
    
    @AppStorage("username") var username = UserDefaults.standard.string(forKey: "username") ?? ""
    @AppStorage("age") var age = UserDefaults.standard.string(forKey: "age") ?? ""
    
    @Published var usernameTF = ""
    @Published var ageTF = ""
    
    var isButtonDisabled : Bool { usernameTF.isEmpty || ageTF.isEmpty || ageOverH }
    
    var goNext = false
    
    var ageOverH: Bool {
        guard let ageChecked = Int(ageTF) else {return false}
        return ageChecked > 100
    }
    
    
    
    func LogInButton() {
        guard Int(ageTF)! < 100 else { return }
//        guard !isButtonDisabled else {return}
        UserDefaults.standard.set(usernameTF, forKey: "username")
        UserDefaults.standard.set(ageTF, forKey: "age")
    }
}


