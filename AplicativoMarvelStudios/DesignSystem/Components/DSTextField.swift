//
//  DSTextField.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

final class DSTextField: UITextField {
    
    init(placeholder: String, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 3
        self.layer.borderColor = DSColors.secondaryColor.cgColor
        self.autocapitalizationType = .none
        self.textColor = DSColors.titleTextColor
        self.isSecureTextEntry = isSecureTextEntry

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always

        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: DSColors.titleTextColor]
        )
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateBorderColor()
    }

    private func updateBorderColor() {
        self.layer.borderColor = DSColors.secondaryColor.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
