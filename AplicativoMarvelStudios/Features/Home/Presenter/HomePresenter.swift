//
//  HomePresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//


import UIKit

// MARK: - Protocol
@MainActor //Garantir que os metodos rode na Thread Principal
protocol HomePresenting: AnyObject {
    func presentCharacters(_ characters: [HeroesModel])
    func showAlertError()
    func showLoading()
    func hideLoading()
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel)
}

// MARK: - Presenter

final class HomePresenter {
    
    // MARK: - Properties
    
    var view: HomeViewDisplay? //weak
    private var coordinator: HomeCoordinating?
    
    // MARK: - Init
    
    init(view: HomeViewDisplay, coordinator: HomeCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

//MARK: - HomePresenting
@MainActor //Garantir que os metodos rode na Thread Principal
extension HomePresenter: HomePresenting {
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel) {
        coordinator?.navigateToDetail(data: data, idPerson: idPerson)
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
