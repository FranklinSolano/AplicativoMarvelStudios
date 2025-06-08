//
//  DetailsViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

// MARK: - Protocol
protocol DetailsViewControllerDisplay: AnyObject {
    
}

// MARK: - DetailsViewController

final class DetailsViewController: UIViewController {

    
    
    // MARK: - Properties
    
    private var screen: DetailsView?
    var interactor: DetailsInteracting?
    var teste: [HeroesModel] = []
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = DetailsView()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teste)
    }
}


// MARK: - DisplayDetailsViewController

extension DetailsViewController: DetailsViewControllerDisplay {
    
}

extension DetailsViewController: DetailsViewProtocol{
    func actionBack() {
        interactor?.navigateBack()
    }
}
