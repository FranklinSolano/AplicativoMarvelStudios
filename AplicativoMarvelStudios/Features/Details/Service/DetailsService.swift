//
//  Untitled.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import Foundation

protocol DetailsServicing {
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<RMCharacter, ServiceError>) -> Void)
}

final class DetailsService: DetailsServicing {
    
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<RMCharacter, ServiceError>) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character/\(id)"
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(RMCharacter.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }
        
        task.resume()
    }
}

