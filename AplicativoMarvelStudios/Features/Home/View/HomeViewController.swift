//
//  ViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

protocol HomeViewDisplay: AnyObject{
    
}


final class HomeViewController: UIViewController {
    
    private var screen: HomeScreen?
    var interactor: HomeInteracting?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension HomeViewController: HomeViewDisplay {
    
}
