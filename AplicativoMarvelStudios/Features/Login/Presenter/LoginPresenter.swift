//
//  LoginPresenter.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import Foundation


// MARK: - Protocol

protocol LoginPresenting: AnyObject {
    func presentNavigationToHome()
}

// MARK: - Presenter

final class LoginPresenter: LoginPresenting {
    
    // MARK: - Properties
    
    weak var view: LoginViewControllerDisplay?
    private var coordinator: LoginCoordinating?
    
    // MARK: - Init
    
    init(view: LoginViewControllerDisplay, coordinator: LoginCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    //MARK: - Outher Methods
    
    func presentNavigationToHome() {
        coordinator?.navigateToHome()
    }
}
