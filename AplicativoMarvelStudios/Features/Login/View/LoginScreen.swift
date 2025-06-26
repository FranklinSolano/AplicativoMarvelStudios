//
//  LoginScreen.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//


import UIKit
import SnapKit

// MARK: - Protocols

protocol LoginScreenProtocol: AnyObject {
    func ActionLoginButton()
    func ActionRegisterButton()
    func ActionForgotPasswordButton()
}

// MARK: - LoginScreen

final class LoginScreen: UIView {
    
    // MARK: - Properties
    
    var delegate: LoginScreenProtocol? //weak
    
    // MARK: - UI Elements
    
    lazy var emailLabel: UILabel = {
        let label = DSLabel(text: "Email:")
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = DSTextField(placeholder: "Enter your email", isSecureTextEntry: false)
        textField.text = "franklin@gmail.com"
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = DSLabel(text: "Password:")
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = DSTextField(placeholder: "Enter your password", isSecureTextEntry: true)
        textField.text = "12345678"
        return textField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = DSButtonTitles(title: "Forgot Password?", font: DSFonts.subtitleSemibold16)
        button.addTarget(self, action: #selector(tappedForgotPassword), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = DSButton(title: "Login")
        button.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = DSButtonTitles(title: "Don't have an account? Sign up", font: DSFonts.subtitleSemibold16)
        button.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func tappedForgotPassword() {
        delegate?.ActionForgotPasswordButton()
    }
    
    @objc private func tappedLogin() {
        delegate?.ActionLoginButton()
    }
    
    @objc private func tappedRegister() {
        delegate?.ActionRegisterButton()
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)  // Fecha o teclado ao tocar fora dos campos de texto
    }
    
    // MARK: - Outher Methods
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)  // A view detecta o toque e chama o método para fechar o teclado
    }
    
}

// MARK: - ViewCodeProtocol

extension LoginScreen: ViewCodeProtocol {
    
    // MARK: - Setup Methods
    
    func setupElements() {
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(forgotPasswordButton)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    func setupConstraints() {
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            make.leading.equalToSuperview().offset(25)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(25)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(25)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        setupTapGesture()
        emailTextField.delegate = self  // Define o delegate para o loginTextField
        passwordTextField.delegate = self  // Define o delegate para o passwordTextField
        backgroundColor = DSColors.primaryColor
    }
}

// MARK: - UITextFieldDelegate

extension LoginScreen: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
