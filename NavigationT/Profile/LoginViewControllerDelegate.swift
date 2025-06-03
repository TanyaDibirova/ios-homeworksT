

import UIKit

protocol LoginViewControllerDelegate {
    func check (login:String, password:String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        if Checker.shered.chek(login: login, password: password) == true {
            return true
        } else {
            return false
        }
    }
}
    
protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
