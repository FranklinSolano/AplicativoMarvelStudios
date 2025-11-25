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
        self.layer.borderWidth = 2
        self.autocapitalizationType = .none
        self.layer.borderColor = DSColors.secondaryColor.cgColor
        
        self.textColor = DSColors.titleTextColor
        self.updateColors()
        
        // Padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDTO(_ dto: TextFieldDTO) {
        self.placeholder = dto.placeholder
        self.isSecureTextEntry = dto.isSecureTextEntry
        
        updatePlaceholder()
    }
    
    // MARK: - Dynamic Theme Updates
    private func updateColors() {
        self.textColor = DSColors.titleTextColor
        updatePlaceholder()
    }
    
    private var dynamicPlaceholderColor: UIColor {
        return UIColor { trait in
            trait.userInterfaceStyle == .dark
            ? UIColor(white: 1.0, alpha: 0.6) // branco com transparência
            : UIColor(white: 0.0, alpha: 0.45) // cinza escuro
        }
    }
    
    private func updatePlaceholder() {
        if let placeholder = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: dynamicPlaceholderColor]
            )
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - DSTextFieldAdapter

final class DSTextFieldAdapter: DSTextField, TextFielding {}
