//
//  Enum+ErrorAPI.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

enum ServiceError: Error {
    case invalidURL
    case requestFailed(Error)
    case noData
    case decodingFailed(Error)
}
