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
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = DetailsView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - DisplayDetailsViewController

extension DetailsViewController: DetailsViewControllerDisplay {
    
}
