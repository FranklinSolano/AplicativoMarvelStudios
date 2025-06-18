//
//  LoginInteractor.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import Foundation

// MARK: - Protocol

protocol LoginInteracting: AnyObject{
    func navigateToHome()
    func navigateToForgotPassword()
    func navigateToRegister()
    func callServiceLogin(email: String, password: String)
}

// MARK: - Interactor

class LoginInteractor {
    
    // MARK: - Properties
    
    weak var presenter: LoginPresenting?
    private var service: LoginServicing?
    
    // MARK: - Init
    
    init(presenter: LoginPresenting, service: LoginServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Outher Methods
}

//MARK: - LoginInteracting

extension LoginInteractor: LoginInteracting {
    
    func callServiceLogin(email: String, password: String) {
        service?.callServiceLogin(email: email, password: password, completion: { [weak self] success in
            DispatchQueue.main.async {
                self?.presenter?.presentShowAlertLogin(success: success)
            }
        })
    }
    
    func navigateToHome() {
        presenter?.presentNavigateToHome()
    }
    
    func navigateToForgotPassword() {
        presenter?.presentNavigateToForgotPassword()
    }
    
    func navigateToRegister() {
        presenter?.presentNavigateToRegister()
    }
}
