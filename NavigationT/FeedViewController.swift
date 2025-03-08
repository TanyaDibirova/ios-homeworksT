//
//  FeedViewController.swift
//  NavigationT
//
//  Created by MacBook on 01.02.2025.
//

import UIKit



class FeedViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Показать пост", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)
           
           return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(actionButton)
        view.backgroundColor = .systemGray5
        title = "Лента пользователя"
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
         NSLayoutConstraint.activate([
             actionButton.leadingAnchor.constraint(
                 equalTo: safeAreaLayoutGuide.leadingAnchor,
                 constant: 20.0
             ),
             actionButton.trailingAnchor.constraint(
                 equalTo: safeAreaLayoutGuide.trailingAnchor,
                 constant: -20.0
             ),
             actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
             actionButton.heightAnchor.constraint(equalToConstant: 44.0),
            
         ])
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

    }
    
    @objc func buttonPressed() {
        let post = Post(title: "Мой пост")
        let postVC = PostViewController(post: post)
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
       }

}
