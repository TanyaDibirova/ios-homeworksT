//
//  PostViewController.swift
//  NavigationT
//
//  Created by MacBook on 01.02.2025.
//

import UIKit

   struct Post {
       var title: String
   }

class PostViewController: UIViewController {
    
    var post: Post
    
    private lazy var actionButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Инфо", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)
           
           return button
       }()
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemTeal
        navigationItem.title = post.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
    }
    
    @objc func buttonPressed() {
        let infoVC = InfoViewController()
        infoVC.modalTransitionStyle = .coverVertical
        infoVC.modalPresentationStyle = .pageSheet
        present(infoVC, animated: true)
    }
       

}
