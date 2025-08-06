//
//  LoginInteractor.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import Foundation

// MARK: - Protocol
@MainActor
protocol LoginInteracting {
    func navigateToHome()
    func navigateToForgotPassword()
    func navigateToRegister()
    func callServiceLogin(email: String, password: String)
}

// MARK: - Interactor

class LoginInteractor {
    
    // MARK: - Properties
    
    let presenter: LoginPresenting
    private let dependencies: HasHttpServicesInterface
    
    // MARK: - Init
    
    init(presenter: LoginPresenting, dependencies: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
    
    //MARK: - Outher Methods
}

//MARK: - LoginInteracting

extension LoginInteractor: LoginInteracting {
    
    
    func callServiceLogin(email: String, password: String) {
        
        let loginService = dependencies.httpServices.makeLoginSErvice()
        
        loginService.callServiceLogin(email: email, password: password, completion: { [ weak self] success, errorMessage in //weak
            DispatchQueue.main.async {
                self?.presenter.presentShowAlertLogin(success: success, errorMessage: errorMessage)
            }
        })
    }
    
    func navigateToHome() {
        presenter.presentNavigateToHome()
    }
    
    func navigateToForgotPassword() {
        presenter.presentNavigateToForgotPassword()
    }
    
    func navigateToRegister() {
        presenter.presentNavigateToRegister()
    }
}
