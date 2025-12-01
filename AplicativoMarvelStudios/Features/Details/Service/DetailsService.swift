//
//  Untitled.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import Foundation

protocol DetailsServicing {
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<SHCharacter, ServiceError>) -> Void)
}

final class DetailsService: DetailsServicing {
    
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<SHCharacter, ServiceError>) -> Void) {
        
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
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
                let decoded = try JSONDecoder().decode(SHCharacter.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }
        
        task.resume()
    }
}
