//
//  DSSearchBar.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

final class DSSearchBar: UISearchBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearch()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSearch() {
        clipsToBounds = true
        layer.cornerRadius = 10
        searchBarStyle = .minimal
        searchTextField.backgroundColor = DSColors.secundaryColor
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search Person",
            attributes: [.foregroundColor: DSColors.titleTextColor]
        )

        if let leftIconView = searchTextField.leftView as? UIImageView {
            leftIconView.tintColor = DSColors.titleTextColor
            
        }
    }
}
