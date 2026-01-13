//
//  AutheticationValidating.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 12/01/26.
//

import Foundation

protocol AuthenticationValidating {
    func validateName(_ name: String) throws -> String
    func validateEmail(_ email: String) throws -> String
    func validatePassword(_ password: String) throws -> String
    func validateConfirmPassword(_ password: String, _ confirmPassword: String) throws -> String
}

final class AuthenticationValidator: AuthenticationValidating {
    
    func validateName(_ name: String) throws -> String {
        guard !name.isEmpty else {
            throw AuthenticationError.emptyName
        }
        return name
    }
    
    func validateEmail(_ email: String) throws -> String {
        guard !email.isEmpty else {
            throw AuthenticationError.emptyEmail
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        guard emailPredicate.evaluate(with: email) else {
            throw AuthenticationError.invalidEmail
        }
        
        return email
    }
    
    func validatePassword(_ password: String) throws -> String {
           guard !password.isEmpty else {
               throw AuthenticationError.emptyPassword
           }
           guard password.count >= 6 else {
               throw AuthenticationError.minimumPassword
           }
           return password
       }
    
    func validateConfirmPassword(_ password: String, _ confirmPassword: String) throws -> String {
         guard password == confirmPassword else {
             throw AuthenticationError.passwordMismatch
         }
         return confirmPassword
     }}
