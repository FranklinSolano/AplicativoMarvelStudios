//
//  ProfileService.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import FirebaseAuth

// MARK: - Protocol

protocol ProfileServicing {
    func logoutAndShowLogin() throws
}

// MARK: - ProfileService

final class ProfileService: ProfileServicing {
    
    // MARK: - Methods
    
    func logoutAndShowLogin() throws {
        try Auth.auth().signOut()
    }
}
