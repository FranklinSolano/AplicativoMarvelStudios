//
//  LoginScreen.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//


import UIKit
import SnapKit


protocol LogindependencyProtocol {
    var emailLabel: Labeling { get }
    var passwordLabel: Labeling { get }
    var emailTextField: TextFielding { get }
    var passwordTextField: TextFielding { get }
    var forgotPasswordButton: Buttoning { get }
    var loginButton: Buttoning { get }
    var registerButton: Buttoning { get }
}

struct LoginDependency: LogindependencyProtocol {
    let emailLabel: Labeling
    let passwordLabel: Labeling
    let emailTextField: TextFielding
    let passwordTextField: TextFielding
    let forgotPasswordButton: Buttoning
    let loginButton: Buttoning
    let registerButton: Buttoning
    
    init(components: DesignSystemComponentsInterface) {
        emailLabel = components.makeLabel()
        passwordLabel = components.makeLabel()
        emailTextField = components.makeTextField()
        passwordTextField = components.makeTextField()
        forgotPasswordButton = components.makeButtonTitles()
        loginButton = components.makeButton()
        registerButton = components.makeButtonTitles()
    }
}

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
    private let dependency: LogindependencyProtocol
    
    
    // MARK: - Init
    
    init(dependency: LogindependencyProtocol) {
        self.dependency = dependency
          super.init(frame: .zero)
          setupView()
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
        dependency.emailLabel.setDTO(.init(text: "Email"))
        dependency.passwordLabel.setDTO(.init(text: "Password"))
    }
    
    private func configureTextFields() {
        dependency.emailTextField.setDTO(.init(placeholder: "Enter your Email",
                                    isSecureTextEntry: false)
        )
        
        dependency.passwordTextField.setDTO(.init(placeholder: "Enter your Password",
                                       isSecureTextEntry: true))
        
        dependency.emailTextField.delegate = self  // Define o delegate para o loginTextField
        dependency.passwordTextField.delegate = self
    }
    
    private func configureButtons(){
        
        dependency.forgotPasswordButton.setDTO(
            .init(title: "Forgot Password", isEnable: true,
                  font: DSFonts.subtitleSemibold16)
        )
        
        dependency.forgotPasswordButton.onClick { [weak self] in
            self?.delegate?.ActionForgotPasswordButton()
        }
        
        
        dependency.loginButton.setDTO(.init(title: "Login",
                                 isEnable: true)
        )
        
        dependency.loginButton.onClick { [weak self] in
            self?.delegate?.ActionLoginButton()
        }
        
        dependency.registerButton.setDTO(.init(title: "Don't have an account? Sign up",
                                    isEnable: true,
                                    font: DSFonts.subtitleSemibold16)
        )
        
        dependency.registerButton.onClick { [weak self] in
            self?.delegate?.ActionRegisterButton()
        }
    }
}

// MARK: - ViewCodeProtocol

extension LoginScreen: ViewCodeProtocol {
    
    // MARK: - Setup Methods
    
    func setupElements() {
        addSubview(dependency.emailLabel)
        addSubview(dependency.emailTextField)
        addSubview(dependency.passwordLabel)
        addSubview(dependency.passwordTextField)
        addSubview(dependency.forgotPasswordButton)
        addSubview(dependency.loginButton)
        addSubview(dependency.registerButton)
    }
    
    func setupConstraints() {
        
        dependency.emailLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            make.leading.equalToSuperview().offset(25)
        }
        
        dependency.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(dependency.emailLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        dependency.passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(dependency.emailTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(25)
        }
        
        dependency.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(dependency.passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        dependency.forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(dependency.passwordTextField.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(25)
        }
        
        dependency.loginButton.snp.makeConstraints { make in
            make.top.equalTo(dependency.forgotPasswordButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        dependency.registerButton.snp.makeConstraints { make in
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
        if textField == dependency.emailTextField {
            dependency.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

extension LoginScreen {
    var emailText: String? {
        dependency.emailTextField.text
    }
    
    var passwordText: String? {
        dependency.passwordTextField.text
    }
}
