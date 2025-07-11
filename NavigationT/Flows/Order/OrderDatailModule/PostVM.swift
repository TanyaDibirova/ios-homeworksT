



import Foundation

protocol PostVM {
    var onClose: Action? { get set }
}

class PostVMImp: PostVM {
    var onClose: Action?
}
