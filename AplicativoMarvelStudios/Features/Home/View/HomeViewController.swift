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
        screen?.configTableView(delegate: self, dataSource: self)
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension HomeViewController: HomeViewDisplay {
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: PersonListTableViewCell.identifier, for: indexPath) as? PersonListTableViewCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
