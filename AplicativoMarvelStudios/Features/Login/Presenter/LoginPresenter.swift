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
    func presentShowAlertLogin(success: Bool, errorMessage: String?)
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
    func presentShowAlertLogin(success: Bool, errorMessage: String?) {
         if success {
             view?.showAlertLogin(title: "Sucesso", message: "Login feito com sucesso ✅", success: true)
         } else {
             let message = errorMessage ?? "Ocorreu um erro desconhecido no login."
             view?.showAlertLogin(title: "Erro no Login", message: message, success: false)
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
