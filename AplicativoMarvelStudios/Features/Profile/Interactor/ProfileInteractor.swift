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
    private var dependenciesService: HasHttpServicesInterface
    
    // MARK: - Init
    
    init(presenter: ProfilePresenting, dependenciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependenciesService = dependenciesService
    }
    
    // MARK: - Methods
    
    func logoutUser() {
        let profileService = dependenciesService.httpServices.makeProfileService()
        do {
            try profileService.logoutAndShowLogin()
            presenter.logoutSuccess()
        } catch {
            presenter.logoutFailed(error: error)
        }
    }
}
