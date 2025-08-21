

import UIKit

class Checker {
    
    private let login = "dibirova"
    private let password = "8888"
    
    static let shered = Checker()
    
    private init() {
        
    }
    
    func chek(login: String, password: String) -> Bool {
        if login == self.login && password == self.password {
            return true
        } else {
            return false
        }
    }
    
}

// Delegate (Делегат)
protocol LoginViewControllerDelegate {
    func check(login: String, password: String)-> Bool
}

struct LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        if Checker.shared.check(login: login, password: password) == true {
            return true
        }else {
            return false
        }
    }
}

// Factory (Фабрика для производства обьектов проверки пароля)
protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
    
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
