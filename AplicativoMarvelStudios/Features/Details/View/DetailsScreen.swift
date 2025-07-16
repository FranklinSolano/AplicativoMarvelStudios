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
        backButton: Buttoning = DSButtonTitlesAdapter(title: "<- Back", font: DSFonts.subtitleSemibold16),
        favoritesButton: ButtonImageing = DSButtonImageAdapter(image: UIImage(systemName: "heart"), tintColor: .red),
        imagePerson: ImageViewing = DSImageViewAdapter(image: nil),
        personName: Labeling = DSLabelAdapter(text: "", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .center),
        descriptionPerson: Labeling = DSLabelAdapter(text: "", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left),
        personRelated: Labeling = DSLabelAdapter(text: "More characters", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .left),
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

    private func setupActions() {
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        favoritesButton.addTarget(self, action: #selector(tappedFavoritesButton), for: .touchUpInside)
    }

    @objc private func tappedBackButton() {
        delegate?.actionBack()
    }

    @objc private func tappedFavoritesButton() {
        isFavorited.toggle()
        let imageName = isFavorited ? "heart.fill" : "heart"
        favoritesButton.setImage(UIImage(systemName: imageName), for: .normal)
        delegate?.actionFavoritesSave()
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
        personRelated.view.isHidden = true
        imagePerson.view.isHidden = true
        favoritesButton.view.isHidden = true
    }

    func hideLoading() {
        activityIndicator.stopAnimating()
        collectionView.view.isHidden = false
        personRelated.view.isHidden = false
        imagePerson.view.isHidden = false
        favoritesButton.view.isHidden = false
    }
}

extension DetailsScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(backButton.view)
        addSubview(favoritesButton.view)
        addSubview(personName.view)
        addSubview(imagePerson.view)
        addSubview(descriptionPerson.view)
        addSubview(personRelated.view)
        addSubview(collectionView.view)
        addSubview(activityIndicator.view)
    }

    func setupConstraints() {
        backButton.view.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(25)
        }

        personName.view.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        favoritesButton.view.snp.makeConstraints { make in
            make.centerY.equalTo(personName.view.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(24)
        }

        imagePerson.view.snp.makeConstraints { make in
            make.top.equalTo(personName.view.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.snp.width).multipliedBy(0.6)
        }

        descriptionPerson.view.snp.makeConstraints { make in
            make.top.equalTo(imagePerson.view.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        personRelated.view.snp.makeConstraints { make in
            make.top.equalTo(descriptionPerson.view.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        collectionView.view.snp.makeConstraints { make in
            make.top.equalTo(personRelated.view.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }

        activityIndicator.view.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        setupActions()
        registerCells()
    }
}
