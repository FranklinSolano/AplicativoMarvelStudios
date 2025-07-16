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
    
    let titleLabel: Labeling
    let imageUser: ImageViewing
    let nameUserLabel: Labeling
    let emailLabel: Labeling
    let emailTextField: TextFielding
    let exitButton: Buttoning
    let selectThemeLabel: Labeling
    let themeSwitcher: SegmentedControling
    let descriptionVersionApp: Labeling
    
    // MARK: - Init com injeção
    
    init(
        titleLabel: Labeling = DSLabelAdapter(text: "Profile", textColor: DSColors.titleTextColor, font: DSFonts.titleBold22, numberOfLines: 0, textAlignment: .center),
        imageUser: ImageViewing = DSImageViewAdapter(image: UIImage(systemName: "person.crop.circle.fill")),
        nameUserLabel: Labeling = DSLabelAdapter(text: "Username: Solas", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left),
        emailLabel: Labeling = DSLabelAdapter(text: "Email", textColor: DSColors.titleTextColor, font: DSFonts.titleBold18, numberOfLines: 0, textAlignment: .left),
        emailTextField: TextFielding = DSTextFieldAdapter(placeholder: "", isSecureTextEntry: false),
        exitButton: Buttoning = DSButtonAdapter(title: "Exit"),
        selectThemeLabel: Labeling = DSLabelAdapter(text: "Select a theme for the app", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left),
        themeSwitcher: SegmentedControling = DSSegmentedControlAdapter(items: ["Claro", "Escuro"]),
        descriptionVersionApp: Labeling = DSLabelAdapter(text: "Version: 1.0.0 - Desenvolvido por Franklin Solano", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
    ) {
        
        self.titleLabel = titleLabel
        self.imageUser = imageUser
        self.nameUserLabel = nameUserLabel
        self.emailLabel = emailLabel
        self.emailTextField = emailTextField
        self.exitButton = exitButton
        self.selectThemeLabel = selectThemeLabel
        self.themeSwitcher = themeSwitcher
        self.descriptionVersionApp = descriptionVersionApp
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Actions
    
    @objc private func tappedExitButton() {
        delegate?.actionExitApp()
    }
    
    @objc private func themeChanged() {
        let selectedTheme: ThemeManager.Theme = themeSwitcher.selectedSegmentIndex == 0 ? .light : .dark
        ThemeManager.shared.setTheme(selectedTheme)
    }
    
    private func actionsButton(){
        exitButton.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        themeSwitcher.addTarget(self, action: #selector(themeChanged), for: .valueChanged)
    }
    
    private func configTranslatesAutoresizingMaskIntoConstraints(){
        titleLabel.view.translatesAutoresizingMaskIntoConstraints = false
        imageUser.view.translatesAutoresizingMaskIntoConstraints = false
        nameUserLabel.view.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.view.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.view.translatesAutoresizingMaskIntoConstraints = false
        exitButton.view.translatesAutoresizingMaskIntoConstraints = false
        selectThemeLabel.view.translatesAutoresizingMaskIntoConstraints = false
        themeSwitcher.view.translatesAutoresizingMaskIntoConstraints = false
        descriptionVersionApp.view.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - ViewCodeProtocol

extension ProfileScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(titleLabel.view)
        addSubview(imageUser.view)
        addSubview(nameUserLabel.view)
        addSubview(emailLabel.view)
        addSubview(emailTextField.view)
        addSubview(exitButton.view)
        addSubview(selectThemeLabel.view)
        addSubview(themeSwitcher.view)
        addSubview(descriptionVersionApp.view)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.view.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageUser.view.topAnchor.constraint(equalTo: titleLabel.view.bottomAnchor, constant: 35),
            imageUser.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageUser.view.widthAnchor.constraint(equalToConstant: 100),
            imageUser.view.heightAnchor.constraint(equalToConstant: 100),
            
            nameUserLabel.view.centerYAnchor.constraint(equalTo: imageUser.view.centerYAnchor),
            nameUserLabel.view.leadingAnchor.constraint(equalTo: imageUser.view.trailingAnchor, constant: 15),
            
            emailLabel.view.topAnchor.constraint(equalTo: imageUser.view.bottomAnchor, constant: 35),
            emailLabel.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailTextField.view.topAnchor.constraint(equalTo: emailLabel.view.bottomAnchor, constant: 15),
            emailTextField.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.view.heightAnchor.constraint(equalToConstant: 50),
            
            exitButton.view.topAnchor.constraint(equalTo: emailTextField.view.bottomAnchor, constant: 60),
            exitButton.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            exitButton.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            exitButton.view.heightAnchor.constraint(equalToConstant: 50),
            
            selectThemeLabel.view.topAnchor.constraint(equalTo: exitButton.view.bottomAnchor, constant: 25),
            selectThemeLabel.view.trailingAnchor.constraint(equalTo: emailTextField.view.trailingAnchor),
            
            themeSwitcher.view.topAnchor.constraint(equalTo: selectThemeLabel.view.bottomAnchor, constant: 5),
            themeSwitcher.view.trailingAnchor.constraint(equalTo: selectThemeLabel.view.trailingAnchor),
            themeSwitcher.view.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionVersionApp.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            descriptionVersionApp.view.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        actionsButton()
        configTranslatesAutoresizingMaskIntoConstraints()
        imageUser.view.tintColor = DSColors.secondaryColor
        emailTextField.text = "franklin@gmail.com"
    }
}
