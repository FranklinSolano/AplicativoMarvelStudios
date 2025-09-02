//
//  RegisterInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import Foundation

protocol RegisterInteracting {
    
}

final class RegisterInteractor {
    var presenter: RegisterPresenting
    private var dependneciesService: HasHttpServicesInterface
    
    init(presenter: RegisterPresenting, dependneciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependneciesService = dependneciesService
    }
    
    
}

extension RegisterInteractor: RegisterInteracting {
    
}
