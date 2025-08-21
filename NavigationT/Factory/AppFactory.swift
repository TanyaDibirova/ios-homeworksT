//
//  AppFactory.swift
//  NavigationT
//
//  Created by MacBook on 21.08.2025.
//

import UIKit

final class AppFactory {
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func makeModule(ofType moduleType: Module.Moduletype) -> Module {
        switch moduleType {
        case .feed:
            let viewModel = FeedViewModel()
            let view = UINavigationController(rootViewController: FeedViewController(viewModel: viewModel))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .profile:
            let viewModel = ProfileViewModel(userService: userService)
            let view = UINavigationController(rootViewController: LogInViewController(viewModel: viewModel))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        }
    }
    
}
