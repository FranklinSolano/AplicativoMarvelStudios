//
//  LoginService.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import Foundation

// MARK: - Protocol

protocol LoginServicing: AnyObject {
    func callServiceLogin(email: String, password: String, completion: @escaping (Bool) -> Void )
}

// MARK: - Service

final class LoginService: LoginServicing {
    func callServiceLogin(email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let success = !email.isEmpty && !password.isEmpty
            completion(success)
        }
    }
}
