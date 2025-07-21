//
//  DetailsView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit
import SnapKit

@MainActor
protocol DetailsViewProtocol {
    func actionBack()
    func actionFavoritesSave()
}

final class DetailsScreen: UIView {

    var delegate: DetailsViewProtocol?
    var isFavorited: Bool = false
    
    let backButton: Buttoning
    let favoritesButton: ButtonImageing
    let imagePerson: ImageViewing
    let personName: Labeling
    let descriptionPerson: Labeling
    let personRelated: Labeling
    let collectionView: CollectionViewing
    let activityIndicator: LoadingIndicatable

    init(
        backButton: Buttoning = DSButtonTitlesAdapter(),
        favoritesButton: ButtonImageing = DSButtonImageAdapter(),
        imagePerson: ImageViewing = DSImageViewAdapter(image: nil),
        personName: Labeling = DSLabelAdapter(),
        descriptionPerson: Labeling = DSLabelAdapter(),
        personRelated: Labeling = DSLabelAdapter(),
        collectionView: CollectionViewing = DSCollectionViewAdapter(scroll: .horizontal, spacing: 10),
        activityIndicator: LoadingIndicatable = DSActivityIndicatorAdapter()
    ) {
        self.backButton = backButton
        self.favoritesButton = favoritesButton
        self.imagePerson = imagePerson
        self.personName = personName
        self.descriptionPerson = descriptionPerson
        self.personRelated = personRelated
        self.collectionView = collectionView
        self.activityIndicator = activityIndicator

        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabels() {
        personName.setDTO(.init(text: "", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .center))
        
        descriptionPerson.setDTO(.init(text: "", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left))
        
        personRelated.setDTO(.init(text: "More characters", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .left))
    }
    
    private func configureButtons() {
        backButton.setDTO(.init(title: "<- Back", isEnable: true, font: DSFonts.subtitleSemibold16))
        backButton.onClick { [weak self] in
            self?.delegate?.actionBack()
        }
        
        upadateFavoriteButton()
        
        favoritesButton.onClick { [weak self] in
            guard let self = self else { return }
            self.isFavorited.toggle()
            self.upadateFavoriteButton()
            self.delegate?.actionFavoritesSave()
        }
    }
    
    private func upadateFavoriteButton() {
        let iconName = isFavorited ? "heart.fill" : "heart"
        let dto = ImageButtonDTO(image: UIImage(systemName: iconName), tintColor: .red, isEnable: true)
        favoritesButton.setDTO(dto)
    }

    func configCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }

    private func registerCells() {
        collectionView.register(ListCharactersCollectionViewCell.self, forCellWithReuseIdentifier: ListCharactersCollectionViewCell.identifier)
    }

    func setupView(data: HeroesModel?) {
        personName.text = data?.heroName

        if let description = data?.descrepitionPerson.trimmingCharacters(in: .whitespacesAndNewlines), !description.isEmpty {
            descriptionPerson.text = "Character description: \(description)"
        } else {
            descriptionPerson.text = "Character description not found"
        }

        // Passa a String direto para o adapter, que faz a conversão interna
        imagePerson.setImage(from: data?.imageURL)
    }

    func showLoading() {
        activityIndicator.startAnimating()
        collectionView.view.isHidden = true
        personRelated.isHidden = true
        imagePerson.view.isHidden = true
        favoritesButton.isHidden = true
    }

    func hideLoading() {
        activityIndicator.stopAnimating()
        collectionView.view.isHidden = false
        personRelated.isHidden = false
        imagePerson.view.isHidden = false
        favoritesButton.isHidden = false
    }
}

extension DetailsScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(backButton)
        addSubview(favoritesButton)
        addSubview(personName)
        addSubview(imagePerson.view)
        addSubview(descriptionPerson)
        addSubview(personRelated)
        addSubview(collectionView.view)
        addSubview(activityIndicator.view)
    }

    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(25)
        }

        personName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        favoritesButton.snp.makeConstraints { make in
            make.centerY.equalTo(personName.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(24)
        }

        imagePerson.view.snp.makeConstraints { make in
            make.top.equalTo(personName.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.snp.width).multipliedBy(0.6)
        }

        descriptionPerson.snp.makeConstraints { make in
            make.top.equalTo(imagePerson.view.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        personRelated.snp.makeConstraints { make in
            make.top.equalTo(descriptionPerson.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        collectionView.view.snp.makeConstraints { make in
            make.top.equalTo(personRelated.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }

        activityIndicator.view.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        configureLabels()
        configureButtons()
        registerCells()
    }
}
