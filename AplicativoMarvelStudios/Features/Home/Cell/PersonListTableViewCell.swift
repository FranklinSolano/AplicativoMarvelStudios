//
//  EmptyTableViewCell.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit
import SDWebImage

// MARK: - PersonListTableViewCell
final class PersonListTableViewCell: UITableViewCell {
    
    static let identifier: String = "PersonListTableViewCell"
    
    // MARK: - Properties
    private let dependencies: HasDesignSystemComponentsInterface
    
    private lazy var imagePerson = dependencies.designSystemComponents.makeImageView()
    private lazy var characterName = dependencies.designSystemComponents.makeLabel()
    private lazy var characterSpecies = dependencies.designSystemComponents.makeLabel()

    // MARK: - Init
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            // Forneça as dependências usando o Resolver ou DependencyContainer
            self.dependencies = DependencyContainer()
            super.init(style: .default, reuseIdentifier: reuseIdentifier)
            setupView()
        }
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(style: .default, reuseIdentifier: Self.identifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabels() {
        characterName.setDTO(
            .init(text: "",
                  textColor: DSColors.titleTextColor,
                  font: DSFonts.subtitleSemibold16,
                  numberOfLines: 1,
                  textAlignment: .left)
        )
        
        characterSpecies.setDTO(
            .init(text: "",
                  textColor: DSColors.titleTextColor,
                  font: DSFonts.captionLight14,
                  numberOfLines: 1,
                  textAlignment: .left)
        )
    }
    
    // MARK: - Setup
    func setupCell(data: SHCharacter) {
        characterName.text = data.name
        characterSpecies.text = "Super Hero" // ou remova esse label
        imagePerson.setImage(from: data.images.lg)
    }
}


// MARK: - ViewCodeProtocol
extension PersonListTableViewCell: ViewCodeProtocol {
    
    func setupElements() {
        contentView.addSubview(imagePerson)
        contentView.addSubview(characterName)
        contentView.addSubview(characterSpecies)
    }
    
    func setupConstraints() {
        imagePerson.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(120)
        }
        
        characterName.snp.makeConstraints { make in
            make.leading.equalTo(imagePerson.snp.trailing).offset(15)
            make.top.equalTo(imagePerson.snp.top).offset(10)
            make.trailing.equalToSuperview().inset(15)
        }
        
        characterSpecies.snp.makeConstraints { make in
            make.leading.equalTo(characterName.snp.leading)
            make.top.equalTo(characterName.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        selectionStyle = .none
        configureLabels()
    }
}

