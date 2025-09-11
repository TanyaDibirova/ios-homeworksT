//
//  AppFactory.swift
//  NavigationT
//
//  Created by MacBook on 07.06.2025.
//

import Foundation

final class AppFactory {
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
}
