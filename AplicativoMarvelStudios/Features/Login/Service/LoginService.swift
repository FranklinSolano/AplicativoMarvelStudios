//
//  LoginService.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//
import FirebaseAuth
import Foundation

// MARK: - Protocol

protocol LoginServicing {
    func callServiceLogin(email: String, password: String, completion: @escaping (Bool, String?) -> Void)
}

// MARK: - Service

final class LoginService: LoginServicing {
    func callServiceLogin(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                print("Erro no login: \(error.localizedDescription)")
                completion(false, error.localizedDescription)
            } else {
                print("Login bem-sucedido ✅")
                completion(true, nil)
            }
        }
    }
}
