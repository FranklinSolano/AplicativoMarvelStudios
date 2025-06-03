//
//  LoginPresenter.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import Foundation


// MARK: - Protocol

protocol LoginPresenting: AnyObject {
    func presentNavigateToHome()
    func presentNavigateToRegister()
    func presentNavigateToForgotPassword()
    func presentShowAlertLogin(success: Bool)
}

// MARK: - Presenter

final class LoginPresenter {
    
    // MARK: - Properties
    
    weak var view: LoginViewControllerDisplay?
    private var coordinator: LoginCoordinating?
    
    // MARK: - Init
    
    init(view: LoginViewControllerDisplay, coordinator: LoginCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    //MARK: - Outher Methods
}

//MARK: - LoginPresenting

extension LoginPresenter: LoginPresenting {
    func presentShowAlertLogin(success: Bool) {
        if success {
            view?.showAlertLogin(title: "Deu certo", message: "Login feito com sucesso")
            coordinator?.navigateToHome()
        } else {
            view?.showAlertLogin(title: "Deu Ruim", message: "Preencha todos os campos")
        }
    }
    
    
    func presentNavigateToHome() {
        coordinator?.navigateToHome()
    }
    
    func presentNavigateToRegister() {
        
    }
    
    func presentNavigateToForgotPassword() {
        
    }
}
