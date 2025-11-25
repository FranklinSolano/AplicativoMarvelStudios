//
//  RegisterInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import Foundation

protocol RegisterInteracting {
    func navigationBackButtonInteractor()
    func navigationHomeButtonInteractor()
    func registerUser(name: String?, email: String?, password: String?, confirmPassword: String?)
}

final class RegisterInteractor {
    var presenter: RegisterPresenting
    private var dependneciesService: HasHttpServicesInterface
    
    init(presenter: RegisterPresenting, dependneciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependneciesService = dependneciesService
    }
    
    
}

//MARK: - RegisterInteracting
extension RegisterInteractor: RegisterInteracting {
    func navigationHomeButtonInteractor() {
        self.presenter.navigationHomeButtonPresenter()
    }
    
    
    func registerUser(name: String?, email: String?, password: String?, confirmPassword: String?) {
        do {
            let user = try validateUserInput(name: name, email: email, password: password, confirmPassword: confirmPassword)
            
            self.dependneciesService.httpServices.makeRegisterService().createUser(user) { result in
                
                switch result {
                    
                case .success:
                    self.presenter.showAlertSuccessPresenter()
                case .failure(let error):
                    let registerError = AuthenticationError.firebaseError(error.localizedDescription)
                    self.presenter.showAlertFailPresenter(registerError)
                }
            }
        } catch {
            
            if let registerError = error as? AuthenticationError {
                self.presenter.showAlertFailPresenter(registerError)
            } else {
                self.presenter.showAlertFailPresenter(.firebaseError(error.localizedDescription))
            }
        }
    }
    
    func navigationBackButtonInteractor() {
        presenter.navigationBackButtonPresenter()
    }
    
    private func validateUserInput(name: String?, email: String?, password: String?, confirmPassword: String?) throws -> UserModel {
         guard let name, !name.isEmpty else {
             throw AuthenticationError.emptyName
         }
         guard let email, !email.isEmpty else {
             throw AuthenticationError.emptyEmail
         }
         guard let password, !password.isEmpty else {
             throw AuthenticationError.emptyPassword
         }
        
         guard password.count >= 6 else {
             throw AuthenticationError.minimumPassword
         }
         guard let confirmPassword, password == confirmPassword else {
             throw AuthenticationError.passwordMismatch
         }
         
         return UserModel(name: name, email: email, password: password)
     }
}
