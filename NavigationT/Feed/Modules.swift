//
//  Modules.swift
//  NavigationT
//
//  Created by MacBook on 21.08.2025.
//

import Foundation

protocol ViewModelProtocol: AnyObject {}

struct Module {
    enum Moduletype {
        case feed
        case profile
    }
    
    let moduleType: Moduletype
    let viewModel: ViewModelProtocol
    let view: UIViewController
}

extension Module.Moduletype {
    var tabBarItem: UITabBarItem {
        switch self {
        case .feed:
            return UITabBarItem(title: "Лента пользователя", image: UIImage(systemName: "square.and.pencil"), tag: 0)
        case.profile:
            return UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)
        }
    }
}
