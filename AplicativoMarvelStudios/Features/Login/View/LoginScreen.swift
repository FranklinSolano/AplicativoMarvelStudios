//
//  LoginScreen.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//


import UIKit
import SnapKit

// MARK: - Protocols

protocol LoginScreenProtocol {
    func ActionLoginButton()
    func ActionRegisterButton()
    func ActionForgotPasswordButton()
}

// MARK: - LoginScreen

final class LoginScreen: UIView {
    
    // MARK: - Properties
    
    var delegate: LoginScreenProtocol?
    
    let emailLabel: Labeling
    let emailTextField: TextFielding
    let passwordLabel: Labeling
    let passwordTextField: TextFielding
    let forgotPasswordButton: Buttoning
    let loginButton: Buttoning
    let registerButton: Buttoning
    
    // MARK: - Init
    
    init(emailLabel: Labeling = DSLabelAdapter(text: "Email"),
         emailTextField: TextFielding = DSTextFieldAdapter(placeholder: "Enter your email", isSecureTextEntry: false),
         passwordLabel: Labeling = DSLabelAdapter(text: "Password"),
         passwordTextField: TextFielding = DSTextFieldAdapter(placeholder: "Enter your passeord", isSecureTextEntry: true),
         forgotPasswordButton: Buttoning = DSButtonTitlesAdapter(title: "Forgot Password?", font: DSFonts.subtitleSemibold16),
         loginButton: Buttoning = DSButtonAdapter(title: "Login"),
         registerButton: Buttoning = DSButtonTitlesAdapter(title: "Don't have an account? Sign up", font: DSFonts.subtitleSemibold16))
    {
        
        self.emailLabel = emailLabel
        self.emailTextField = emailTextField
        self.passwordLabel  = passwordLabel
        self.passwordTextField = passwordTextField
        self.forgotPasswordButton = forgotPasswordButton
        self.loginButton = loginButton
        self.registerButton = registerButton
        
        super.init(frame: .zero)
        setupView()
        actionsButtons()
        self.emailTextField.text = "franklin@gmail.com"
        self.passwordTextField.text = "12345678"
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
    
    private func actionsButtons(){
        forgotPasswordButton.addTarget(self, action: #selector(tappedForgotPassword), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
    }
    
}

// MARK: - ViewCodeProtocol

extension LoginScreen: ViewCodeProtocol {
    
    // MARK: - Setup Methods
    
    func setupElements() {
        addSubview(emailLabel.view)
        addSubview(emailTextField.view)
        addSubview(passwordLabel.view)
        addSubview(passwordTextField.view)
        addSubview(forgotPasswordButton.view)
        addSubview(loginButton.view)
        addSubview(registerButton.view)
    }
    
    func setupConstraints() {
        
        emailLabel.view.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            make.leading.equalToSuperview().offset(25)
        }
        
        emailTextField.view.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.view.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        passwordLabel.view.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.view.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(25)
        }
        
        passwordTextField.view.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.view.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        forgotPasswordButton.view.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.view.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(25)
        }
        
        loginButton.view.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.view.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        registerButton.view.snp.makeConstraints { make in
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
        if textField == emailTextField.view {
            passwordTextField.view.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
