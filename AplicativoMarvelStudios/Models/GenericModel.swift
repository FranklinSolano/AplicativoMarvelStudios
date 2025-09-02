//
//  GenericModel.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/06/25.
//

import Foundation

struct HeroesModel: Codable {
    var id: Int
    var heroName: String
    var imageURL: String
    var descrepitionPerson: String
}



struct RickAndMortyResponse: Codable {
    let results: [RMCharacter]
}

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}

