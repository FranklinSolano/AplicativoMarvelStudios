//
//  Untitled.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import Foundation
import CryptoKit

// MARK: - Protocol
protocol DetailsServicing {
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<HeroesModel, ServiceError>) -> Void)
}

// MARK: - Service
final class DetailsService: DetailsServicing {
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<HeroesModel, ServiceError>) -> Void) {
        let ts = String(Date().timeIntervalSince1970)
           let hash = (ts + Keys.marvelPrivateKey + Keys.marvelPublicKey).md5
           let urlString = "https://gateway.marvel.com/v1/public/characters/\(id)?ts=\(ts)&apikey=\(Keys.marvelPublicKey)&hash=\(hash)"
           
           guard let url = URL(string: urlString) else {
               print("URL inválida")
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
                   let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                   guard let character = decoded.data.results.first else {
                       completion(.failure(.noData))
                       return
                   }
                   
                   let hero = HeroesModel(
                       id: character.id ?? 0,
                       heroName: character.name,
                       imageURL: character.thumbnail.fullPath,
                       descrepitionPerson: character.description
                   )
                   
                   completion(.success(hero))
                   
               } catch {
                   print("Erro ao decodificar JSON: \(error)")
                   completion(.failure(.decodingFailed(error)))
               }
           }

           task.resume()
    }
}

