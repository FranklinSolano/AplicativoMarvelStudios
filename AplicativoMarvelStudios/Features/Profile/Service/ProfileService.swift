//
//  ProfileService.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//
import FirebaseAuth

protocol ProfileServicing: AnyObject {
    func logoutAndShowLogin() throws
}

final class ProfileService: ProfileServicing {
    func logoutAndShowLogin() throws {
        try Auth.auth().signOut()
    }
    

}
