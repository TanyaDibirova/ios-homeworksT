

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
     //   view.backgroundColor = .systemBlue
        
        return view
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Профиль"
        
        view.addSubview(profileHeaderView)
        
        profileHeaderView.frame = view.frame

    }
    
 

}
