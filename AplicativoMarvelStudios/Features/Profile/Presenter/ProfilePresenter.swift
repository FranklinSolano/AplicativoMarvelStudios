//
//  ProfilePresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

// MARK: - Protocol

protocol ProfilePresenting: AnyObject {
    func logoutSuccess()
    func logoutFailed(error: Error)
}

// MARK: - ProfilePresenter

final class ProfilePresenter: ProfilePresenting {
    
    // MARK: - Properties
    
    var view: ProfileViewDisplay? //weak
    private var coordinator: ProfileCoordinating?
    
    // MARK: - Init
    
    init(view: ProfileViewDisplay, coordinator: ProfileCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    // MARK: - ProfilePresenting Methods
    
    func logoutSuccess() {
        coordinator?.navigateToLogin()
    }
    
    func logoutFailed(error: any Error) {
        view?.logoutError(message: error.localizedDescription)
    }
}
