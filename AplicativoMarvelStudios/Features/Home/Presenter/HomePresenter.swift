//
//  HomePresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//


import UIKit

// MARK: - Protocol

protocol HomePresenting: AnyObject {
    
}

// MARK: - Presenter

final class HomePresenter: HomePresenting {
    
    // MARK: - Properties
    
    weak var view: HomeViewDisplay?
    private var coordinator: HomeCoordinating?
    
    // MARK: - Init
    
    init(view: HomeViewDisplay, coordinator: HomeCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    //MARK: - Outher Methods
    
}
