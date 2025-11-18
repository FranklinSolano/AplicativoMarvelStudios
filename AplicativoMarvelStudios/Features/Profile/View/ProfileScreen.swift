//
//  ProfileScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//


import UIKit

// MARK: - ProfileScreenProtocol
protocol ProfileScreenProtocol: AnyObject {
    func actionExitApp()
}

// MARK: - ProfileScreen com ViewCodeProtocol

final class ProfileScreen: UIView {
    
    weak var delegate: ProfileScreenProtocol?
    private let dependencies: HasDesignSystemComponentsInterface
    
    private lazy var titleLabel = dependencies.designSystemComponents.makeLabel()
    private lazy var imageUser = dependencies.designSystemComponents.makeImageView()
    private lazy var nameUserLabel = dependencies.designSystemComponents.makeLabel()
    private lazy var emailLabel = dependencies.designSystemComponents.makeLabel()
    private lazy var emailTextField = dependencies.designSystemComponents.makeTextField()
    private lazy var exitButton = dependencies.designSystemComponents.makeButton()
    private lazy var selectThemeLabel = dependencies.designSystemComponents.makeLabel()
    private lazy var themeSwitcher = dependencies.designSystemComponents.makeSegmentedControling()
    private lazy var descriptionVersionApp  = dependencies.designSystemComponents.makeLabel()
    
    // MARK: - Init com injeção
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configureLabels(){
        titleLabel.setDTO(.init(text: "Profile", textColor: DSColors.titleTextColor, font: DSFonts.titleBold22, numberOfLines: 0, textAlignment: .center))
        
        nameUserLabel.setDTO(.init(text: "Username: Solas", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left))
        
        emailLabel.setDTO(.init(text: "Email", textColor: DSColors.titleTextColor, font: DSFonts.titleBold18, numberOfLines: 0, textAlignment: .left))
        
        selectThemeLabel.setDTO(.init(text: "Select a theme for the app", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left))
        
        descriptionVersionApp.setDTO(.init(text: "Version: 1.0.0 - Desenvolvido por Franklin Solano", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left))
    }
    
    private func configureTextFields(){
        emailTextField.setDTO(.init(placeholder: "", isSecureTextEntry: false))
        emailTextField.text = "franklin@gmail.com"
    }
    
    private func configureButtons(){
        
        exitButton.setDTO(.init(title: "Exit"))
                          
        exitButton.onClick { [weak self] in
            self?.delegate?.actionExitApp()
        }
    }
    
    private func configureSegmentedControl(){
        themeSwitcher.setItems(["Light", "Dark"]) // //// 🟢 Define o índice baseado no tema atual
        let currentTheme = ThemeManager.shared.currentTheme
        themeSwitcher.selectedSegmentIndex = currentTheme == .light ? 0 : 1
        
        themeSwitcher.onClick { index in
            let selectedTheme: ThemeManager.Theme = index == 0 ? .light : .dark
            ThemeManager.shared.setTheme(selectedTheme)
        }
    }
    
    
    // MARK: - Actions
}

// MARK: - ViewCodeProtocol

extension ProfileScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(titleLabel)
        addSubview(imageUser)
        addSubview(nameUserLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(exitButton)
        addSubview(selectThemeLabel)
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
            
            selectThemeLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 25),
            selectThemeLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            themeSwitcher.topAnchor.constraint(equalTo: selectThemeLabel.bottomAnchor, constant: 5),
            themeSwitcher.trailingAnchor.constraint(equalTo: selectThemeLabel.trailingAnchor),
            themeSwitcher.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionVersionApp.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            descriptionVersionApp.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        configureLabels()
        configureTextFields()
        configureButtons()
        configureSegmentedControl()
        imageUser.tintColor = DSColors.secondaryColor
    }
}
