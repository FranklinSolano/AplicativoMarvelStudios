//
//  DSSearchBar.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

//MARK: - SearchBaring

protocol SearchBaring: UIView {
    var delegate: UISearchBarDelegate? { get set }
    var text: String? { get set }
    func resignFirstResponder()
}

//MARK: - SearchBaring

final class DSSearchBarAdapter: UISearchBar, SearchBaring {

    init() {
        super.init(frame: .zero)
        placeholder = "Search"
        barTintColor = DSColors.secondaryColor
        searchBarStyle = .minimal
        searchTextField.backgroundColor = DSColors.secondaryColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resignFirstResponder() {}
}
