import FirebaseAuth
import Foundation

protocol ForgotPasswordServicing {
    func forgotPasswordToEnter(email: String, completion: @escaping (Result<Void, AuthenticationError>) -> Void)
}

final class ForgotPasswordService: ForgotPasswordServicing {
    func forgotPasswordToEnter(email: String, completion: @escaping (Result<Void, AuthenticationError>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                let authError = self.mapFirebaseError(error)
                completion(.failure(authError))
            } else {
                completion(.success(()))
            }
        }
    }
    
    private func mapFirebaseError(_ error: Error) -> AuthenticationError {
        let nsError = error as NSError
        
        switch nsError.code {
        case AuthErrorCode.userNotFound.rawValue:
            return .userNotFound
            
        case AuthErrorCode.invalidEmail.rawValue:
            return .invalidEmail
            
        case AuthErrorCode.networkError.rawValue:
            return .networkError
            
        case AuthErrorCode.tooManyRequests.rawValue:
            return .tooManyRequests
            
        default:
            return .firebaseError(error.localizedDescription)
        }
    }
}
