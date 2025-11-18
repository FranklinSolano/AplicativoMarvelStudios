//
//  RegisterInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import Foundation

protocol RegisterInteracting {
    func navigationBackButtonInteractor()
    func creatCollectionUser()
    func registerUser()
    func creatCollectionFavorites()
    func validationPassword(password: String, confirmedPassword: String)
}

final class RegisterInteractor {
    var presenter: RegisterPresenting
    private var dependneciesService: HasHttpServicesInterface
    
    init(presenter: RegisterPresenting, dependneciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependneciesService = dependneciesService
    }
    
    
}

extension RegisterInteractor: RegisterInteracting {
    func validationPassword(password: String, confirmedPassword: String) {
        if password != confirmedPassword {
            presenter.validationPasswordFail()
        } else {
            creatCollectionUser()
        }
    }
    
    func creatCollectionUser() {
        
    }
    
    func registerUser() {
        
    }
    
    func creatCollectionFavorites() {
        
    }
    
    func navigationBackButtonInteractor() {
        presenter.navigationBackButtonPresenter()
    }
    
    
}
