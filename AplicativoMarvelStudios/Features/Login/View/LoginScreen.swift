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
}

// MARK: - LoginScreen

final class LoginScreen: UIView {
    
    // MARK: - Properties
    
    weak var delegate: LoginScreenProtocol?
    
    // MARK: - UI Elements
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
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
    @objc private func tappedLogin() {
        delegate?.ActionLoginButton()
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
        addSubview(loginButton)
    }
    
    func setupConstraints() {
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
    }
    
    func setupAdditionalConfiguration() {}
}

