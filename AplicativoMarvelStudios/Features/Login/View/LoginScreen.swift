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
    
    init(
          emailLabel: Labeling = DSLabelAdapter(),
          emailTextField: TextFielding = DSTextFieldAdapter(),
          passwordLabel: Labeling = DSLabelAdapter(),
          passwordTextField: TextFielding = DSTextFieldAdapter(),
          forgotPasswordButton: Buttoning = DSButtonTitlesAdapter(),
          loginButton: Buttoning = DSButtonAdapter(),
          registerButton: Buttoning = DSButtonTitlesAdapter()
      ) {
          self.emailLabel = emailLabel
          self.emailTextField = emailTextField
          self.passwordLabel  = passwordLabel
          self.passwordTextField = passwordTextField
          self.forgotPasswordButton = forgotPasswordButton
          self.loginButton = loginButton
          self.registerButton = registerButton
          
          super.init(frame: .zero)
          
          setupView()
          configureButtons()
          
          self.emailTextField.text = "franklin@gmail.com"
          self.passwordTextField.text = "12345678"
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)  // Fecha o teclado ao tocar fora dos campos de texto
    }
    
    // MARK: - Outher Methods
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)  // A view detecta o toque e chama o método para fechar o teclado
    }
    
    private func configureLabels(){
        emailLabel.setDTO(.init(text: "Email"))
        passwordLabel.setDTO(.init(text: "Password"))
    }
    
    private func configureTextFields() {
        emailTextField.setDTO(.init(placeholder: "Enter your Email",
                                    isSecureTextEntry: false)
        )
        
        passwordTextField.setDTO(.init(placeholder: "Enter your Password",
                                       isSecureTextEntry: true))
        
        emailTextField.delegate = self  // Define o delegate para o loginTextField
        passwordTextField.delegate = self
    }
    
    private func configureButtons(){
        
        forgotPasswordButton.setDTO(
            .init(title: "Forgot Password", isEnable: true,
                  font: DSFonts.subtitleSemibold16)
        )
        
        forgotPasswordButton.onClick { [weak self] in
            self?.delegate?.ActionForgotPasswordButton()
        }
        
        
        loginButton.setDTO(.init(title: "Login",
                                 isEnable: true)
        )
        
        loginButton.onClick { [weak self] in
            self?.delegate?.ActionLoginButton()
        }
        
        registerButton.setDTO(.init(title: "Don't have an account? Sign up",
                                    isEnable: true,
                                    font: DSFonts.subtitleSemibold16)
        )
        
        registerButton.onClick { [weak self] in
            self?.delegate?.ActionRegisterButton()
        }
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
        configureLabels()
        configureTextFields()
        configureButtons()
        setupTapGesture()
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
