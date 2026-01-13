//
//  DSSearchBar.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin Stilhano Solano on 28/05/25.
//

import UIKit

protocol SearchBaring: UIView {
    var delegate: UISearchBarDelegate? { get set }
    var text: String? { get set }
    func resignFirstResponder()
}

final class DSSearchBarAdapter: UISearchBar, SearchBaring {

    init() {
        super.init(frame: .zero)
        setupStyle()
        registerForTraitChanges()
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupStyle() {
        placeholder = "Search"
        searchBarStyle = .minimal
        backgroundImage = UIImage()
        backgroundColor = .clear

        // Configura o textField interno
        let textField = searchTextField
        textField.backgroundColor = DSColors.secondaryColor
        textField.textColor = DSColors.titleTextColor
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.tintColor = DSColors.textWhiteColor // cursor branco

        // Placeholder e ícone
        updatePlaceholderAndIcon()

        // Arredonda o background da barra
        if let backgroundView = subviews.first?.subviews.first {
            backgroundView.backgroundColor = DSColors.secondaryColor
            backgroundView.layer.cornerRadius = 15
            backgroundView.clipsToBounds = true
        }
    }

    private func registerForTraitChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            let textField = self.searchTextField
            textField.backgroundColor = DSColors.secondaryColor
            textField.textColor = DSColors.titleTextColor
            textField.tintColor = DSColors.textWhiteColor
            self.updatePlaceholderAndIcon()

            if let backgroundView = self.subviews.first?.subviews.first {
                backgroundView.backgroundColor = DSColors.secondaryColor
                backgroundView.layer.cornerRadius = 15
                backgroundView.clipsToBounds = true
            }
        }
    }

    private func updatePlaceholderAndIcon() {
        if let placeholder = self.placeholder {
            let color = DSColors.textWhiteColor.withAlphaComponent(0.6)
            searchTextField.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: color]
            )
        }

        if let iconView = searchTextField.leftView as? UIImageView {
            iconView.tintColor = DSColors.textWhiteColor
        }
    }

    func resignFirstResponder() {
        searchTextField.resignFirstResponder()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
