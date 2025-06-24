//
//  ProfilePresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

protocol ProfilePresenting: AnyObject {
    func logoutSuccess()
        func logoutFailed(error: Error)
}

final class ProfilePresenter: ProfilePresenting {

    
    
    weak var view: ProfileViewDisplay?
    private var coordinator: ProfileCoordinating?
    
    init(view: ProfileViewDisplay, coordinator: ProfileCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func logoutSuccess() {
        coordinator?.navigateToLogin()
    }
    
    func logoutFailed(error: any Error) {
        view?.logoutError(message: error.localizedDescription)
    }
}
