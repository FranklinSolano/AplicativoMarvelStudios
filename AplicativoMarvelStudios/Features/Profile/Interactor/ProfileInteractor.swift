//
//  ProfileInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

protocol ProfileInteracting: AnyObject {
    func logoutUser()
}

final class ProfileInteractor: ProfileInteracting {
    
    weak var presenter: ProfilePresenting?
    private var service: ProfileServicing?
    
    init(presenter: ProfilePresenting, service: ProfileServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    func logoutUser() {
        do {
            try service?.logoutAndShowLogin()
            presenter?.logoutSuccess()
        } catch {
            presenter?.logoutFailed(error: error)
        }
    }
}
