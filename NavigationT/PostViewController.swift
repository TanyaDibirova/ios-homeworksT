

import UIKit

struct Posts {
       var title: String
   }

class PostViewController: UIViewController {
    
    var posts: Posts
    
    private lazy var actionButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Инфо", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)
           
           return button
       }()
    
    init(posts: Posts) {
        self.posts = posts
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemTeal
        navigationItem.title = posts.title
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
