//
//  HomeInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

protocol HomeInteracting: AnyObject {
    
}

final class HomeInteractor: HomeInteracting {
    
    weak var presenter: HomePresenting?
    private var service: HomeService?
    
    init(presenter: HomePresenting, service: HomeService) {
        self.presenter = presenter
        self.service = service
    }
    
}
