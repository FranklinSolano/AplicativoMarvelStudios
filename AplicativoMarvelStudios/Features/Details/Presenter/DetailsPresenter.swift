//
//  DetailsPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

//MARK: - Protocol
protocol DetailsPresenting {
    func navigateBack() async
    func getDetailsPerson(result: SHCharacter)
    func showResultAlertError(title: String, message: String)
    func showLoading()
    func hideLoading()
    func updateDetails(id: SHCharacter, data: [SHCharacter]) async
}

//MARK: - DetailsPresenter

final class DetailsPresenter {
    
    // MARK: - Properties
    
    weak var view: DetailsViewControllerDisplay?
    private var coordinator: DetailsCoordinating
    
    // MARK: - Init
    
    init(view: DetailsViewControllerDisplay? = nil, coordinator: DetailsCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - DetailsPresenting

extension DetailsPresenter: DetailsPresenting {
    func updateDetails(id: SHCharacter, data: [SHCharacter]) async {
        await coordinator.updateDetails(id: id, data: data)
    }
    
    func showLoading() {
            Task { @MainActor in
                self.view?.showLoading()
            }
        }

        func hideLoading() {
            Task { @MainActor in
                self.view?.hideLoading()
            }
        }

        func showResultAlertError(title: String, message: String) {
            Task { @MainActor in
                self.view?.showResultAlertError(title: title, message: message)
            }
        }

    func getDetailsPerson(result: SHCharacter) {
            Task { @MainActor in
                self.view?.getResultDataPerson(data: result)
            }
        }
    
    func navigateBack() async {
        await coordinator.navigateBack()
    }
}
