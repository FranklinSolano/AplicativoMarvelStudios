//
//  GenericModel.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/06/25.
//

import Foundation

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
    let xsImage: String
    let smImage: String
    let mdImage: String
    let lgImage: String
}
