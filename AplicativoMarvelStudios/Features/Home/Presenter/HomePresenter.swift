//
//  HomePresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol
@MainActor
protocol HomePresenting {
    func presentCharacters(_ characters: [SHCharacter])
    func showAlertError()
    func showLoading()
    func hideLoading()
    func navigateToDetail(character: SHCharacter, randomCharacters: [SHCharacter])
}

// MARK: - Presenter
final class HomePresenter {
    
    // MARK: - Properties
    weak var view: HomeViewDisplay?
    private var coordinator: HomeCoordinating
    
    // MARK: - Init
    init(view: HomeViewDisplay? = nil, coordinator: HomeCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - HomePresenting
extension HomePresenter: HomePresenting {
    func navigateToDetail(character: SHCharacter, randomCharacters: [SHCharacter]) {
        coordinator.navigateToDetail(character: character, randomCharacters: randomCharacters)
    }
    
    func presentCharacters(_ characters: [SHCharacter]) {
        view?.displayCharacters(characters)
    }
    
    func showAlertError() {
        view?.showAlertError(title: "Atenção", message: "Erro ao buscar personagens, tente novamente!")
    }
    
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        view?.hideLoading()
    }
}

