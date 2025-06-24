//
//  ProfileScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit
import SnapKit

protocol ProfileScreenProtocol: AnyObject {
    func actionExitApp()
}

final class ProfileScreen: UIView {
    
    weak var delegate: ProfileScreenProtocol?
    
    private lazy var titleLabel: UILabel = {
        let label = DSLabel(text: "Profile", textColor: DSColors.titleTextColor, font: DSFonts.titleBold22, numberOfLines: 0, textAlignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageUser: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = DSColors.secondaryColor
        image.layer.cornerRadius = 50 // Metade da largura/altura para ficar redonda
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameUserLabel: UILabel = {
        let label = DSLabel(text: "Username: Solas", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = DSLabel(text: "Email", textColor: DSColors.titleTextColor, font: DSFonts.titleBold18, numberOfLines: 0, textAlignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private  lazy var emailTextField: UITextField = {
        let textField = DSTextField(placeholder: "", isSecureTextEntry: false)
        textField.text = "franklin@gmail.com"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var exitButton: UIButton = {
        let button = DSButton(title: "Exit")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var selecionThemeLabel: UILabel = {
        let label = DSLabel(text: "Select a theme for the app", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var themeSwitcher: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Claro", "Escuro"])
        control.selectedSegmentIndex = ThemeManager.shared.currentTheme == .dark ? 1 : 0
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(themeChanged), for: .valueChanged)
        return control
    }()
    
    private lazy var descriptionVersionApp: UILabel = {
        let label = DSLabel(text: "Version: 1.0.0 - Desenvolvido por Franklin Solano", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedExitButton() {
        delegate?.actionExitApp()
    }
    
    @objc private func themeChanged() {
        let selectedTheme: ThemeManager.Theme = themeSwitcher.selectedSegmentIndex == 0 ? .light : .dark
        ThemeManager.shared.setTheme(selectedTheme)
        themeSwitcher.selectedSegmentIndex = selectedTheme == .dark ? 1 : 0
    }
    
    
}

extension ProfileScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(titleLabel)
        addSubview(imageUser)
        addSubview(nameUserLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(exitButton)
        addSubview(selecionThemeLabel)
        addSubview(themeSwitcher)
        addSubview(descriptionVersionApp)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageUser.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            imageUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageUser.widthAnchor.constraint(equalToConstant: 100),
            imageUser.heightAnchor.constraint(equalToConstant: 100),
            
            nameUserLabel.centerYAnchor.constraint(equalTo: imageUser.centerYAnchor),
            nameUserLabel.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 15),
            
            emailLabel.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 35),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            exitButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 60),
            exitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            exitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            exitButton.heightAnchor.constraint(equalToConstant: 50),
            
            selecionThemeLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 25),
            selecionThemeLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            themeSwitcher.topAnchor.constraint(equalTo: selecionThemeLabel.bottomAnchor, constant: 5),
            themeSwitcher.trailingAnchor.constraint(equalTo: selecionThemeLabel.trailingAnchor),
            themeSwitcher.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionVersionApp.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            descriptionVersionApp.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
    }
}

