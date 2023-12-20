//
//  GameViewModel.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 22.11.2023.
//

import Foundation
import SwiftUI 

class GameViewModel : ObservableObject {
        
    var countriesNames: [String] = ["Ukraine", "Canada",
                                    "Japan", "USA",
                                    "Germany", "France",
                                    "Italy", "Spain",
                                    "China", "Brazil",
                                    "Australia", "India",
                                    "Mexico", "South Korea",
                                    "Argentina", "United Kingdom",
                                    "Netherlands", "Sweden", "Switzerland"]
    
    @Published var randomCountry = ""
    @Published var isRight: Bool?
    @Published var score = 0
    @AppStorage("record") var record = UserDefaults.standard.integer(forKey: "record") 
    
    func getRandomCountry() {
        randomCountry = countriesNames.randomElement() ?? ""
    }
    
    var buttons: [String] = []
    
    func getet() {
        var uniqueValues: Set<String> = [randomCountry]

        while uniqueValues.count < 3 {
            if let randomElement = countriesNames.randomElement() {
                uniqueValues.insert(randomElement)
            }
        }

        buttons = Array(uniqueValues)
    }
    
    func validate(item: String) {
        isRight = (item == randomCountry)
        if isRight ==  true {
            score += 1
            UserDefaults.standard.setValue(score, forKey: "score")
            if score > record {
                record = score
                UserDefaults.standard.set(record, forKey: "record")
            }
        } else {score = 0}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isRight = nil
            self.getRandomCountry()
            self.getet()
        }
    }
}
