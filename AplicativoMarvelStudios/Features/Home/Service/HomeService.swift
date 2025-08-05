//
//  HomeService.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import Foundation
import CryptoKit



// MARK: - Protocol
protocol HomeServicing {
    func fetchCharacters(completion: @escaping (Result<[HeroesModel], ServiceError>) -> Void)
}

final class HomeService: HomeServicing {
    func fetchCharacters(completion: @escaping (Result<[HeroesModel], ServiceError>) -> Void) {
        
        let ts = "1"  // timestamp fixo para teste
           let hashString = ts + Keys.marvelPrivateKey + Keys.marvelPublicKey
           let hash = hashString.md5
           
           print("🧮 String para hash: '\(hashString)'")
           print("🔒 Hash MD5: '\(hash)'")
           
           let urlString = "https://gateway.marvel.com/v1/public/characters?limit=5&ts=\(ts)&apikey=\(Keys.marvelPublicKey)&hash=\(hash)"
           print("📡 URL de teste:\n\(urlString)")
        
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
                let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                let viewModels = decoded.data.results.compactMap { character -> HeroesModel? in
                    guard let id = character.id else { return nil }
                    return HeroesModel(
                        id: id,
                        heroName: character.name,
                        imageURL: character.thumbnail.fullPath,
                        descrepitionPerson: character.description ?? ""
                    )
                }
                completion(.success(viewModels))
            } catch {
                print("❌ Erro ao decodificar JSON:")
                print(String(data: data, encoding: .utf8) ?? "JSON inválido")
                print(error)
                completion(.failure(.decodingFailed(error)))
            }
        }
        task.resume()
    }
}


// Extensão para gerar o hash MD5
extension String {
    var md5: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
