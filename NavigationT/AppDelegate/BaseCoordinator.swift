


import UIKit

typealias Action = (() -> Void)

protocol FlowCoordinator: AnyObject {
    var parentCoordinator: MainBaseCoordinator? { get set }
}

protocol Coordinator: FlowCoordinator {
    var rootViewController: UIViewController { get set }
    func start() -> UIViewController
    @discardableResult func resetToRoot() -> Self
}

extension Coordinator {
    var navigationRootViewController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
// MARK: - Tabbar Protocol
protocol FeedBaseCoordinator: Coordinator {
    func showFeedScreen()
}

protocol LoginBaseCoordinator: Coordinator {
    func showHomeScreen()
}

protocol MainBaseCoordinator: Coordinator {
    var loginCoordinator: LoginBaseCoordinator { get }
    var fedCoordinator: FeedBaseCoordinator { get }
    func moveTo(flow: AppFlow)
}

