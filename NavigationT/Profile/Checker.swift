

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
