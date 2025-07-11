



import Foundation

protocol FeedVM {
    var onNext: Action? { get set }
}

class FeedVMImp: FeedVM {
    var onNext: Action?
}
