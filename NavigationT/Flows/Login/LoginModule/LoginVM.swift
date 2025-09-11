

import Foundation

protocol LoginVM {
    var onDetail: Action? { get set }
}

class LoginVMImp: LoginVM {
    var onDetail: Action?
}
