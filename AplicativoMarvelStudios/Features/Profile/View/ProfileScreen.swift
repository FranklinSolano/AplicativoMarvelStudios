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
        return label
    }()
    
    private lazy var imageUser: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = DSColors.secondaryColor
        image.layer.cornerRadius = 50 // Metade da largura/altura para ficar redonda
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var nameUserLabel: UILabel = {
        let label = DSLabel(text: "Username: Solas", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = DSLabel(text: "Email", textColor: DSColors.titleTextColor, font: DSFonts.titleBold18, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    private  lazy var emailTextField: UITextField = {
        let textField = DSTextField(placeholder: "", isSecureTextEntry: false)
        textField.text = "franklin@gmail.com"
        return textField
    }()
    
    lazy var exitButton: UIButton = {
        let button = DSButton(title: "Exit")
        button.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var selecionThemeLabel: UILabel = {
        let label = DSLabel(text: "Select a theme for the app", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    private lazy var themeSwitcher: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Claro", "Escuro"])
        control.selectedSegmentIndex = ThemeManager.shared.currentTheme == .dark ? 1 : 0
        control.addTarget(self, action: #selector(themeChanged), for: .valueChanged)
        return control
    }()
    
    private lazy var descriptionVersionApp: UILabel = {
        let label = DSLabel(text: "Version: 1.0.0 - Desenvolvido por Franklin Solano", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
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
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.centerX.equalToSuperview()
        }
        
        
        imageUser.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(100) // Tamanho fixo, você pode ajustar
        }
        
        nameUserLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageUser.snp.centerY)
            make.leading.equalTo(imageUser.snp.trailing).offset(15)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(imageUser.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(44)
        }
        
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        selecionThemeLabel.snp.makeConstraints { make in
            make.top.equalTo(exitButton.snp.bottom).offset(45)
            make.trailing.equalToSuperview().inset(20)
        }
        
        themeSwitcher.snp.makeConstraints { make in
            make.top.equalTo(selecionThemeLabel.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(200)
        }
        
        descriptionVersionApp.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
    }
    
    
}
