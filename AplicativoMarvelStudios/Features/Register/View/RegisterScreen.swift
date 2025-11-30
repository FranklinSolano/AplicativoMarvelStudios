//
//  RegisterScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

final class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    private let dependencies: HasDesignSystemComponentsInterface
    
    private lazy var backGroudImage = dependencies.designSystemComponents.makeImageView()
    private lazy var backButton = dependencies.designSystemComponents.makeButtonTitles()
    private lazy var nameLabel = dependencies.designSystemComponents.makeLabel()
     lazy var nameTextField = dependencies.designSystemComponents.makeTextField()
    private lazy var emailLabel = dependencies.designSystemComponents.makeLabel()
     lazy var emailTextField = dependencies.designSystemComponents.makeTextField()
    private lazy var passwordLabel = dependencies.designSystemComponents.makeLabel()
    lazy var passwordTextField = dependencies.designSystemComponents.makeTextField()
    private lazy var confirmedPasswordLabel = dependencies.designSystemComponents.makeLabel()
    lazy var confirmedPasswordTextField = dependencies.designSystemComponents.makeTextField()
    private lazy var registerButton = dependencies.designSystemComponents.makeButton()
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        nameLabel.setDTO(.init(text: "Nome:"))
        emailLabel.setDTO(.init(text: "Email:"))
        passwordLabel.setDTO(.init(text: "Senha:"))
        confirmedPasswordLabel.setDTO(.init(text: "Confirmar Senha:"))
    }
    
    private func configureTextField() {
        nameTextField.setDTO(.init(placeholder: "Digite seu nome", isSecureTextEntry: false))
        nameTextField.delegate = self
        emailTextField.setDTO(.init(placeholder: "Digite seu email", isSecureTextEntry: false))
        emailTextField.delegate = self
        passwordTextField.setDTO(.init(placeholder: "Digite sua senha", isSecureTextEntry: true))
        passwordTextField.delegate = self
        confirmedPasswordTextField.setDTO(.init(placeholder: "Digite novamente sua senha", isSecureTextEntry: true))
        confirmedPasswordTextField.delegate = self
    }
    
    private func configureButton() {
        backButton.setDTO(.init(title: "<- Back", isEnable: true, font: DSFonts.subtitleSemibold16))
        backButton.onClick { [weak self] in
            self?.delegate?.actionBackButton()
        }
        
        registerButton.setDTO(.init(title: "Register", isEnable: true, font: DSFonts.subtitleSemibold16))
        registerButton.onClick { [weak self] in
            self?.delegate?.actionRegisterButton()
        }
        
    }
    
    private func configureBackGroundImage() {
        backGroudImage.image = UIImage(named: "")
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)  // A view detecta o toque e chama o método para fechar o teclado
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)  // Fecha o teclado ao tocar fora dos campos de texto
    }
}

extension RegisterScreen: ViewCodeProtocol {
    func setupElements() {
        [backGroudImage, backButton, nameLabel, nameTextField, emailLabel, emailTextField, passwordLabel,
         passwordTextField, confirmedPasswordLabel,
         confirmedPasswordTextField, registerButton].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backGroudImage.topAnchor.constraint(equalTo: topAnchor),
            backGroudImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroudImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGroudImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            nameLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmedPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmedPasswordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            confirmedPasswordTextField.topAnchor.constraint(equalTo: confirmedPasswordLabel.bottomAnchor, constant: 10),
            confirmedPasswordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            confirmedPasswordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            confirmedPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: confirmedPasswordTextField.bottomAnchor, constant: 45),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 195),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        configureBackGroundImage()
        configureLabel()
        configureTextField()
        configureButton()
        setupTapGesture()
    }
}

extension RegisterScreen: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
