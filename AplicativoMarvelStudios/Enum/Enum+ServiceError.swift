//
//  Enum+ErrorAPI.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case requestFailed(Error)
    case noData
    case decodingFailed(Error)
}

enum AuthenticationError: LocalizedError {
    case emptyName
    case emptyEmail
    case emptyPassword
    case passwordMismatch
    case firebaseError(String)
    case minimumPassword
    case invalidEmail
    case userNotFound
    case networkError
    case tooManyRequests
    
    var errorDescription: String? {
        switch self {
        case .emptyName:
            return "O nome não pode ser vazio."
        case .emptyEmail:
            return "O e-mail não pode ser vazio."
        case .emptyPassword:
            return "A senha não pode ser vazia."
        case .passwordMismatch:
            return "As senhas não conferem."
        case .firebaseError(let message):
            return "Erro ao criar usuário: \(message)"
        case .minimumPassword:
            return "A senha deve conter no mínimo 6 dígitos."
        case .invalidEmail:
            return "E-mail inválido."
        case .userNotFound:
            return "Nenhuma conta encontrada com este e-mail."
        case .networkError:
            return "Erro de conexão. Verifique sua internet."
        case .tooManyRequests:
            return "Muitas tentativas. Tente novamente mais tarde."
        }
    }
}
