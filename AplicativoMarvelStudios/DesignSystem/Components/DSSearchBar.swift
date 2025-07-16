//
//  DSSearchBar.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

protocol SearchBaring: AnyObject {
    var view: UIView { get }
    var delegate: UISearchBarDelegate? { get set }
    var text: String? { get set }
    func resignFirstResponder()
}

final class DSSearchBarAdapter: UISearchBar, SearchBaring {
    func resignFirstResponder() {}
    
    var view: UIView { return self }

    init() {
        super.init(frame: .zero)
        placeholder = "Search"
        barTintColor = DSColors.primaryColor
        searchBarStyle = .minimal
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
