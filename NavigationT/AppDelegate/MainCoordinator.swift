


/*

let firstVC = FeedViewController()
let secondVC = LogInViewController()
secondVC.loginDelegate = LoginInspector()
let tabBarController = UITabBarController()

firstVC.tabBarItem = UITabBarItem(title: "Лента пользователя", image: UIImage(systemName: "square.and.pencil"), tag: 0)

secondVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)
let controllers = [firstVC,secondVC]
tabBarController.viewControllers = controllers.map {
    UINavigationController(rootViewController: $0)
}
    tabBarController.selectedIndex = 1
*/

import UIKit

enum AppFlow {
    case login
    case feed
}

class MainCoordinator: MainBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    
    lazy var loginCoordinator: LoginBaseCoordinator = LoginCoordinator()
    lazy var fedCoordinator: FeedBaseCoordinator = FedCoordinator()
    
    lazy var rootViewController: UIViewController = UITabBarController()
    
    func start() -> UIViewController {
        let loginViewController = loginCoordinator.start()
        loginCoordinator.parentCoordinator = self
        loginViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(
                systemName: "person.fill"
            ),
            tag: 1
        )
        
        let feedViewController = fedCoordinator.start()
        fedCoordinator.parentCoordinator = self
        feedViewController.tabBarItem = UITabBarItem(
            title: "Лента пользователя",
            image: UIImage(
                systemName: "square.and.pencil"
            ),
            tag: 0
        )
        
        (rootViewController as? UITabBarController)?.viewControllers = [loginViewController,feedViewController]
        
        return rootViewController
    }
    
    func moveTo(flow: AppFlow) {
        switch flow {
        case .login:
            (rootViewController as? UITabBarController)?.selectedIndex = 1
        case .feed:
            (rootViewController as? UITabBarController)?.selectedIndex = 0
        }
    }
    
    func resetToRoot() -> Self {
        loginCoordinator.resetToRoot()
        moveTo(flow: .login)
        return self
    }
}
