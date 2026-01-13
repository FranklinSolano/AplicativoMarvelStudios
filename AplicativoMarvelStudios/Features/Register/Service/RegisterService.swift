//
//  RegisterService.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

// MARK: - RegisterServicing
protocol RegisterServicing {
    func createUser(_ user: UserModel, completion: @escaping (Result<Void, Error>) -> Void)
}

// MARK: - RegisterService
final class RegisterService: RegisterServicing {
    func createUser(_ user: UserModel, completion: @escaping (Result<Void, any Error>) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResut, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let uid = authResut?.user.uid else {
                completion(.failure(AuthenticationError.firebaseError("UID nao encontrado")))
                return
            }
            
            let data: [String: Any] = [
                
                "id": uid,
                "name": user.name,
                "email": user.email,
                "createdAt": Timestamp(date: user.createdAt)
            ]
            
            Firestore.firestore().collection("users").document(uid).setData(data) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
                
            }
        }
    }
}
