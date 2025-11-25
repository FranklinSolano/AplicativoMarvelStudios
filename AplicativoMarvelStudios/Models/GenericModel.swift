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


struct SHCharacter: Codable {
    let id: Int
    let name: String
    let powerstats: PowerStats
    let biography: Biography
    let appearance: Appearance
    let images: SHImages
}

// MARK: - Submodels

struct PowerStats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Biography: Codable {
    let fullName: String
    let alterEgos: String
    let aliases: [String]
    let placeOfBirth: String
    let publisher: String?
    let alignment: String
}

struct Appearance: Codable {
    let gender: String
    let race: String?
    let height: [String]
    let weight: [String]
}

struct SHImages: Codable {
    let xs: String
    let sm: String
    let md: String
    let lg: String
}
