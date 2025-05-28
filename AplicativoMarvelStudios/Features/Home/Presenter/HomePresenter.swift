//
//  HomePresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//


import UIKit

protocol HomePresenting: AnyObject {
    
}

final class HomePresenter: HomePresenting {
    weak var view: HomeViewDisplay?
    private var coordinator: HomeCoordinating?
    
    init(view: HomeViewDisplay, coordinator: HomeCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
}
