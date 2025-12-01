//
//  HomeService.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//
import CryptoKit
import Foundation

// MARK: - Protocol
protocol HomeServicing {
    func fetchCharacters(completion: @escaping (Result<[SHCharacter], ServiceError>) -> Void)
}

final class HomeService: HomeServicing {
    func fetchCharacters(completion: @escaping (Result<[SHCharacter], ServiceError>) -> Void) {

        let urlString = "https://akabab.github.io/superhero-api/api/all.json"

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
                // API retorna um array direto
                let decoded = try JSONDecoder().decode([SHCharacter].self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }

        task.resume()
    }
}
