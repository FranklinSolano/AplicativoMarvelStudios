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
    
    private let imagePerson: ImageViewing
    private let heroName: Labeling

    // MARK: - Init
    
    init(
        imagePerson: ImageViewing = DSImageViewAdapter(image: .placeholder),
        heroName: Labeling = DSLabelAdapter()
    ) {
        self.imagePerson = imagePerson
        self.heroName = heroName
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
        addSubview(imagePerson.view)
        addSubview(heroName)
    }
    
    func setupConstraints() {
        imagePerson.view.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(95)
            make.width.equalTo(85)
        }
        
        heroName.snp.makeConstraints { make in
            make.leading.equalTo(imagePerson.view.snp.trailing).offset(15)
            make.centerY.equalTo(imagePerson.view.snp.centerY)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        selectionStyle = .none
        configureLabels()
    }
}
