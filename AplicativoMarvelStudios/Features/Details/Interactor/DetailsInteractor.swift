//
//  DetailsInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

protocol DetailsInteracting: AnyObject {
    func navigateBack()
}

final class DetailsInteractor {
    
    weak var presenter: DetailsPresenting?
    private var  service: DetailsServicing?
    
    init(presenter: DetailsPresenting, service: DetailsServicing) {
        self.presenter = presenter
        self.service = service
    }
}

extension DetailsInteractor: DetailsInteracting {
    func navigateBack() {
        presenter?.navigateBack()
    }
    
    
}
