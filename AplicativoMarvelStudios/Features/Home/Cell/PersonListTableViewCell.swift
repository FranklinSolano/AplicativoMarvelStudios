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
    private lazy var heroName = dependencies.designSystemComponents.makeLabel()

    // MARK: - Init
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(style: .default, reuseIdentifier: Self.identifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabels(){
        heroName.setDTO(.init(text: "", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .left))
    }
    
    // MARK: - Setup
    
    func setupCell(data: HeroesModel?) {
        heroName.text = data?.heroName
        
        if let urlString = data?.imageURL {
            imagePerson.setImage(from: urlString)
        } else {
            imagePerson.image = .placeholder
        }
    }
}


// MARK: - ViewCodeProtocol
extension PersonListTableViewCell: ViewCodeProtocol {
    
    func setupElements() {
        contentView.addSubview(imagePerson)
        contentView.addSubview(heroName)
    }
    
    func setupConstraints() {
        imagePerson.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(95)
            make.width.equalTo(85)
        }
        
        heroName.snp.makeConstraints { make in
            make.leading.equalTo(imagePerson.snp.trailing).offset(15)
            make.centerY.equalTo(imagePerson.snp.centerY)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        selectionStyle = .none
        configureLabels()
    }
}
