//
//  OnboardingCoordinator.swift
//  NavigationT
//
//  Created by MacBook on 20.07.2025.
//


import UIKit

class OnBoardingCoordinator: Coordinator {
    
    override func start() {
        let vc = LogInViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}


