//
//  LeaksTest.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 24/06/25.
//
import UIKit

final class LeakedPresenter {
    var closure: (() -> Void)?

    init() {
        print("LeakedPresenter criado")
        self.closure = {
            print("Usando self dentro da closure: \(self)")
        }
    }

    deinit {
        print("❌ LeakedPresenter foi desalocado")
    }
}
