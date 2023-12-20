//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Artem Leschenko on 21.11.2023.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    @AppStorage("username") var userName = UserDefaults.standard.string(forKey: "username") ?? ""
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if userName.isEmpty {
                    LogInView()
                        .transition(.opacity)
                } else {
                    StartView()
                        .transition(.opacity)
                }
            }.animation(.easeInOut, value: userName)
                .preferredColorScheme(.light)
        }
    }
}


extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем жест
        let panGesture = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector(("handleNavigationTransition:")))
        panGesture.delegate = self
        self.view.addGestureRecognizer(panGesture)
        
        // Отключаем встроенный жест
        self.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
    

