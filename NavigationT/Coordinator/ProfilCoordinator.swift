


import UIKit

final class ProfilCoordinator: ModuleCoordinatable {
    var moduleType: Module.Moduletype
    
    private let factory: AppFactory
    
    var childCoordinators: [Coordinatable] = []
    var module: Module?
    var loginDelegate: LoginViewControllerDelegate?
    
    
    init(moduleType: Module.Moduletype, factory: AppFactory) {
        self.moduleType = moduleType
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let module = factory.makeModule(ofType: moduleType)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        self.module = module
        return viewController
    }
    

    
    func pushProfileViewController() {
        
#if DEBUG
let service = TestUserService()
#else
let service = CurrentUserService()
#endif
        let viewModel = ProfileViewModel(userService: service)
        let loginVC = LogInViewController(viewModel: viewModel)
//        let profileVC = ProfileViewController(user: User)

        let loginDelegate = MyLoginFactory().makeLoginInspector()
        
//        let viewControllerToPush = ProfileViewController(user: User.init(login: "123", fullName: "Sainchuk", avatar: UIImage(named: "avatar")!, status: "Test Status"))
//        (module?.view as?
//         UINavigationController)?.pushViewController(viewControllerToPush, animated: true)
//        print("заглушка")
//
        if loginDelegate.check(login: loginVC.loginTextField.text ?? "", password: loginVC.passwordTextField.text ?? "") == true {

            guard let user = service.userService(login: loginVC.loginTextField.text ?? "")else {return print("opps")}
            let profileVC = ProfileViewController(user: user )
            (module?.view as?
             UINavigationController)?.setViewControllers([profileVC], animated: true)
            

        }else   {
            loginVC.errorAlert()
        }
    }
    
    
}

