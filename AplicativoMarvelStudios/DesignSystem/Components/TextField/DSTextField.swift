//
//  DSTextField.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

// MARK: - TextFieldDTO

struct TextFieldDTO {
    let placeholder: String
    let isSecureTextEntry: Bool
}

// MARK: - TextFielding

protocol TextFielding: UIView {
    var text: String? { get set }
    func setDTO(_ dto: TextFieldDTO)
    var delegate: UITextFieldDelegate? { get set }
}

// MARK: - DSTextField

class DSTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        registerForTraitChanges()
    }
    
    private func setup() {
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = 15
        layer.borderWidth = 2
        autocapitalizationType = .none
        layer.borderColor = DSColors.secondaryColor.cgColor
        
        textColor = DSColors.titleTextColor
        updateColors()
        
        // Padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        leftView = paddingView
        leftViewMode = .always
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func registerForTraitChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            self.updateColors()
        }
    }
    
    func setDTO(_ dto: TextFieldDTO) {
        placeholder = dto.placeholder
        isSecureTextEntry = dto.isSecureTextEntry
        updatePlaceholder()
    }
    
    // MARK: - Dynamic Theme Updates
    
    private func updateColors() {
        textColor = DSColors.titleTextColor
        updatePlaceholder()
    }
    
    private var dynamicPlaceholderColor: UIColor {
        return UIColor { trait in
            trait.userInterfaceStyle == .dark
            ? UIColor(white: 1.0, alpha: 0.6)
            : UIColor(white: 0.0, alpha: 0.45)
        }
    }
    
    private func updatePlaceholder() {
        if let placeholder = placeholder {
            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: dynamicPlaceholderColor]
            )
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DSTextFieldAdapter

final class DSTextFieldAdapter: DSTextField, TextFielding {}
