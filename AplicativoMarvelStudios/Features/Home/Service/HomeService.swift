//
//  HomeService.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//
import Foundation
import CryptoKit



// MARK: - Protocol
protocol HomeServiceProtocol {
    func fetchCharacters(completion: @escaping ([HeroesModel]) -> Void)
}

final class HomeService: HomeServiceProtocol {
    func fetchCharacters(completion: @escaping ([HeroesModel]) -> Void) {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = (ts + Keys.marvelPrivateKey + Keys.marvelPublicKey).md5
        let urlString = "https://gateway.marvel.com/v1/public/characters?limit=100&ts=\(ts)&apikey=\(Keys.marvelPublicKey)&hash=\(hash)"

        guard let url = URL(string: urlString) else {
            print("URL inválida")
            completion([])
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Erro na requisição: \(error?.localizedDescription ?? "desconhecido")")
                completion([])
                return
            }

            do {
                let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                let viewModels = decoded.data.results.compactMap { character -> HeroesModel? in
                    guard let id = character.id else { return nil }
                    return HeroesModel(
                        id: id,
                        heroName: character.name,
                        imageURL: character.thumbnail.fullPath
                    )
                }
                completion(viewModels)
            } catch {
                print("Erro ao decodificar JSON: \(error)")
                completion([])
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
