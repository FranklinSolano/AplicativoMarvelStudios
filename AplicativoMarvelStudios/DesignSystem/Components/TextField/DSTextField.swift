//
//  DSTextField.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

//MARK: - TextFieldDTO
struct TextFieldDTO {
    let placeholder: String
    let isSecureTextEntry: Bool
    
    init(placeholder: String, isSecureTextEntry: Bool) {
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
    }
}

//MARK: - TextFielding

protocol TextFielding: UIView {
    var text: String? { get set }
    func setDTO(_ dto: TextFieldDTO)
    var delegate: UITextFieldDelegate? { get set }
}

//MARK: - DSTextField

class DSTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 3
        self.layer.borderColor = DSColors.secondaryColor.cgColor
        self.autocapitalizationType = .none
        self.textColor = DSColors.titleTextColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setDTO(_ dto: TextFieldDTO) {
        self.placeholder = dto.placeholder
        self.isSecureTextEntry = dto.isSecureTextEntry
        self.attributedPlaceholder = NSAttributedString(
            string: dto.placeholder,
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

//MARK: - DSTextFieldAdapter

final class DSTextFieldAdapter: DSTextField, TextFielding {}
