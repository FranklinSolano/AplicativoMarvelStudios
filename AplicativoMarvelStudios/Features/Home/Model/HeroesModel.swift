//
//  HomeModel.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import Foundation

struct HeroesModel: Codable {
    var id: Int
    var heroName: String
    var imageURL: String
    var descrepitionPerson: String
}

struct CharacterResponse: Codable {
    let data: CharacterData
}

struct CharacterData: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int?
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String
    let `extension`: String

    var fullPath: String {
        return "\(path).\(self.extension)".replacingOccurrences(of: "http://", with: "https://")
    }
}
