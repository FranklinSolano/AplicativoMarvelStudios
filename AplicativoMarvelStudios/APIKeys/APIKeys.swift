//
//  KeysAPI.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import Foundation
import CryptoKit

struct Keys {
    static var marvelPublicKey: String {
        return value(forKey: "marvelPublicKey")
    }
    
    static var marvelPrivateKey: String {
        return value(forKey: "marvelPrivateKey")
    }
    
    private static func value(forKey key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
              let value = dict[key] as? String else {
            fatalError("Keys.plist está faltando ou não contém a chave \(key)")
        }
        return value
    }
}
