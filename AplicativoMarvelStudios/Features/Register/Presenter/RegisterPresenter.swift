//
//  RegisterPresenter.swift
//  AplicativoRickAndMorty
//
//  Created by Franklin  Stilhano Solano on 28/10/25.
//

import Foundation

//MARK: - RegisterPresenting
protocol RegisterPresenting {
    func navigationBackButtonPresenter()
    func navigationHomeButtonPresenter()
    func showAlertSuccessPresenter()
    func showAlertFailPresenter(_ error: AuthenticationError)
}

//MARK: - RegisterPresenter
final class RegisterPresenter {
    
    //MARK: - Properties
    weak var view: RegisterViewControllerDisplay?
    let coordinator: RegisterCoordinating?
    
    //MARK: - Init
    
    init(view: RegisterViewControllerDisplay? = nil, coordinator: RegisterCoordinating?) {
        self.view = view
        self.coordinator = coordinator
    }
}

//MARK: - RegisterPresenting
extension RegisterPresenter: RegisterPresenting {
    func navigationHomeButtonPresenter() {
        coordinator?.navigationhomeButtonCoordinator()
    }
    
    func showAlertSuccessPresenter() {
        view?.showAlertLogin(title: "Sucesoo", message: "Cadastro realizado com Sucesso!", success: true)
    }
    
    func showAlertFailPresenter(_ error: AuthenticationError) {
        view?.showAlertLogin(title: "Atencao", message: error.localizedDescription, success: false)
    }
    
    
    func navigationBackButtonPresenter() {
        coordinator?.navigationBackButtonCoordinator()
    }
}
