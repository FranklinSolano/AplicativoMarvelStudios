//
//  ProfileScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

protocol ProfileScreenProtocol: AnyObject {
    func actionExitApp()
}

final class ProfileScreen: UIView {
    
    weak var delegate: ProfileScreenProtocol?
    
    private lazy var imageUser: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50 // Metade da largura/altura para ficar redonda
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var nameUserLabel: UILabel = {
        let label = DSLabel(text: "Solas", textColor: DSColors.titleTextColor, font: DSFonts.titleBold18, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    private  lazy var emailTextField: UITextField = {
        let textField = DSTextField(placeholder: "", isSecureTextEntry: false)
        textField.text = "franklin@gmail.com"
        return textField
    }()
    
    lazy var exitButton: UIButton = {
        let button = DSButtonTitles(title: "Exit", font: DSFonts.titleBold22)
                button.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var descriptionVersionApp: UILabel = {
        let label = DSLabel(text: "Version: 1.0.0 - Desenvolvido por Franklin Solano", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .left)
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
}

extension ProfileScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(imageUser)
        addSubview(nameUserLabel)
        addSubview(emailTextField)
        addSubview(exitButton)
        addSubview(descriptionVersionApp)
    }
    
    func setupConstraints() {
        
        imageUser.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100) // Tamanho fixo, você pode ajustar
        }
        
        nameUserLabel.snp.makeConstraints { make in
            make.top.equalTo(imageUser.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameUserLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(44)
        }
        
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
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
