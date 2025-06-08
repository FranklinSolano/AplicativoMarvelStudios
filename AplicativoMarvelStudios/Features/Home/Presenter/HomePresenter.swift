//
//  HomePresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//


import UIKit


// MARK: - Protocol

protocol HomePresenting: AnyObject {
    func presentCharacters(_ characters: [HeroesModel])
    func showAlertError()
    func showLoading()
    func hideLoading()
    func navigateToDetail(data: [HeroesModel])
}

// MARK: - Presenter

final class HomePresenter {
    
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

//MARK: - HomePresenting

extension HomePresenter: HomePresenting {
    func navigateToDetail(data: [HeroesModel]) {
        coordinator?.navigateToDetail(data: data)
    }
    
    func presentCharacters(_ characters: [HeroesModel]) {
        view?.displayCharacters(characters)
    }
    
    func showAlertError(){
        view?.showAlertError(title: "Atenção", message: "Error ao buscar personagens, Tente novamente!")
    }
    
    func showLoading() {
        view?.showLoading()
    }
    func hideLoading() {
        view?.hideLoading()
    }
}
