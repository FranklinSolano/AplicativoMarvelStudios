//
//  UserModel.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 24/11/25.
//

import Foundation


struct UserModel {
    let id: String
    let name: String
    let email: String
    let password: String
    let createdAt: Date
    
    init(name: String, email: String, password: String) {
        self.id = UUID().uuidString
        self.name = name
        self.email = email
        self.password = password
        self.createdAt = Date()
    }
}
