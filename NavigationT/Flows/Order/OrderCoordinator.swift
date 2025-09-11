
import UIKit

class FedCoordinator: FeedBaseCoordinator {
   
    var parentCoordinator: MainBaseCoordinator?
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let viewModel = FeedVMImp()
        viewModel.onNext = { [weak self] in
            self?.showFeedScreen()
        }
        let module = FeedViewController(
            viewModel: viewModel
        )
        rootViewController = UINavigationController(
            rootViewController: module
        )
        return rootViewController
    }
    
    func showFeedScreen() {
        let viewModel = PostVMImp()
        viewModel.onClose = { [weak self] in
            self?.parentCoordinator?.moveTo(flow: .feed)
        }
        let module = PostViewController(
            viewModel: viewModel
        )
        navigationRootViewController?.pushViewController(module, animated: true)
    }
}
