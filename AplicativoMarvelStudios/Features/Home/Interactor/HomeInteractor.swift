//
//  HomeInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeInteracting: AnyObject {
    
}

// MARK: - Interactor

final class HomeInteractor: HomeInteracting {
    
    // MARK: - Properties
    
    weak var presenter: HomePresenting?
    private var service: HomeService?
    
    // MARK: - Init
    
    init(presenter: HomePresenting, service: HomeService) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Outher Methods
    
}
