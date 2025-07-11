//
//  ProfileInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//


import UIKit

// MARK: - Protocol

protocol ProfileInteracting {
    func logoutUser()
}

// MARK: - ProfileInteractor

final class ProfileInteractor: ProfileInteracting {
    
    // MARK: - Properties
    
    var presenter: ProfilePresenting
    private var service: ProfileServicing?
    
    // MARK: - Init
    
    init(presenter: ProfilePresenting, service: ProfileServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    // MARK: - Methods
    
    func logoutUser() {
        do {
            try service?.logoutAndShowLogin()
            presenter.logoutSuccess()
        } catch {
            presenter.logoutFailed(error: error)
        }
    }
}
