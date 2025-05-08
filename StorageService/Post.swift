//
//  Post.swift
//  NavigationT
//
//  Created by MacBook on 02.04.2025.
//

import UIKit

public struct Menu {
    
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    
}

 public extension Menu {
    
    static func make() -> [Menu] {
        [
        
        Menu(author: "И.И.Шишкина и К.А.Савицкого",  description: "Утро в сосновом лесу",  image: "forest", likes: 255, views: 259),
        Menu(author: "Фёдор Решетников", description: "Опять двойка", image: "two", likes: 211, views: 215),
        Menu(author: "Виктор Васнецов", description: "Аленушка", image: "alena", likes: 199, views: 203),
        Menu(author: "Илья Репин", description: "Садко", image: "sadko", likes: 340, views: 345)
        ]
    }
}
