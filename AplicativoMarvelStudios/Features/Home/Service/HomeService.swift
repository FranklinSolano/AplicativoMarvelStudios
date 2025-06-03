//
//  HomeService.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import Foundation

// MARK: - Protocol


protocol HomeServiceProtocol {
    func fetchCharacters(completion: @escaping ([HeroesModel]) -> Void)
}

//https://run.mocky.io/v3/cc9b3b06-47bb-4713-b5d6-6fe4ca128abd

final class HomeService: HomeServiceProtocol {
    func fetchCharacters(completion: @escaping ([HeroesModel]) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/1d20a929-6fcc-4e35-b1fe-c5eb6c628639") else {
            completion([])
            return
        }

       let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
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
                print("Erro ao decodificar: \(error)")
                completion([])
            }
        }
        task.resume()
    }
}


