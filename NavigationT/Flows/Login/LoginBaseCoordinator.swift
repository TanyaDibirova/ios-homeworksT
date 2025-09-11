


import UIKit

class LoginCoordinator: LoginBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let viewModel = LoginVMImp()
        viewModel.onDetail = { [weak self] in
            self?.showHomeScreen()
        }
        let module = LoginVC(
            viewModel: viewModel
        )
        rootViewController = UINavigationController(
            rootViewController: module
        )
        return rootViewController
    }
    
    func showHomeScreen() {
        let vc = ProfileViewController()
        navigationRootViewController?.pushViewController(vc, animated: true)
    }
}
