//
//  ProfileViewModel.swift
//  NavigationT
//
//  Created by MacBook on 20.08.2025.
//


import Foundation

protocol ProfileViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((ProfileViewModel.State)-> Void)? { get set }
}

final class ProfileViewModel: ProfileViewModelProtocol {
    
    
    enum State {
        case initial
        case loading
    }
    enum ViewInput {
        case loginButtonDidTap
    }
    
 //   weak var coordinator: ProfilCoordinator?
    
    var onStateDidChange: ((State) -> Void)?
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    private let userService: UserService
    init(userService: UserService) {
        self.userService = userService
    }
    
 //   func updateState(viewInput: ViewInput) {
 //       switch viewInput {
 //       case .loginButtonDidTap:
 //           state = .loading
  //          coordinator?.pushProfileViewController()
            
  //      }
    }

