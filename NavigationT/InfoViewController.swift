//
//  InfoViewController.swift
//  NavigationT
//
//  Created by MacBook on 02.02.2025.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Показать сообщение", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)
           
           return button
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        title = "Информация"
        
        view.addSubview(actionButton)
        
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
        actionButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc private func showAlert() {
        let alertVC = UIAlertController(title: "Это алерт контроллер", message: "Это сообщение", preferredStyle: .alert)
        present(alertVC, animated: true)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let messageAction = UIAlertAction(title: "Сообщение", style: .default) {_ in
            print("Это сообщение из UIAlertController")
        }
        alertVC.addAction(messageAction)
        alertVC.addAction(cancelAction)
    }


}
