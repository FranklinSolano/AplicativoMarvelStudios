//
//  ForgotPasswordScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 01/12/25.
//

import UIKit

protocol ForgotPasswordScreenProtocol: AnyObject {
    func actionBackButton()
    func actionEnterButton()
}

final class ForgotPasswordScreen: UIView {
    weak var delegate: ForgotPasswordScreenProtocol?
    
    private let dependencies: HasDesignSystemComponentsInterface
    
    private lazy var backGroundImageView = dependencies.designSystemComponents.makeImageView()
    private lazy var backButton = dependencies.designSystemComponents.makeButtonTitles()
    private lazy var titleLabel = dependencies.designSystemComponents.makeLabel()
    private lazy var emailLabel = dependencies.designSystemComponents.makeLabel()
    private lazy var emailTextField = dependencies.designSystemComponents.makeTextField()
    private lazy var enterButton = dependencies.designSystemComponents.makeButton()
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configLabel() {
        titleLabel.setDTO(.init(text: "informe o seu email para redefinir a senha!"))
        
        emailLabel.setDTO(.init(text: "Email:"))
    }
    private func configButton() {
        backButton.setDTO(.init(title: "back <-"))
        backButton.onClick { [weak self] in
            self?.delegate?.actionBackButton()
        }
        
        enterButton.setDTO(.init(title: "Enter"))
        enterButton.onClick { [weak self] in
            self?.delegate?.actionEnterButton()
        }
        
    }
    
    private func configureBackGroundImage() {
        backGroundImageView.image = UIImage(named: "imageLogin")
    }
}

extension ForgotPasswordScreen: ViewCodeProtocol {
    func setupElements() {
        [backGroundImageView, backButton, titleLabel, emailLabel, emailTextField, enterButton].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backGroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backGroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            enterButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            enterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            enterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            enterButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupAdditionalConfiguration() {
        configLabel()
        configButton()
        configureBackGroundImage()
    }
}
