//

import UIKit

public struct Post {
    
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    
}

extension Post {
    
    public static func make() -> [Post] {
        [
        
            Post(author: "И.И.Шишкина и К.А.Савицкого",  description: "Утро в сосновом лесу",  image: "forest", likes: 255, views: 259),
            Post(author: "Фёдор Решетников", description: "Опять двойка", image: "two", likes: 211, views: 215),
            Post(author: "Виктор Васнецов", description: "Аленушка", image: "alena", likes: 199, views: 203),
            Post(author: "Илья Репин", description: "Садко", image: "sadko", likes: 340, views: 345)
        ]
    }
}
