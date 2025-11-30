//
//  DetailsView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//
import SnapKit
import UIKit

@MainActor
protocol DetailsViewProtocol {
    func actionBack()
    func actionFavoritesSave()
}

final class DetailsScreen: UIView {

    private let dependencies: HasDesignSystemComponentsInterface
    var delegate: DetailsViewProtocol?
    var isFavorited: Bool = false

    private lazy var backButton = dependencies.designSystemComponents.makeButtonTitles()
    private lazy var favoritesButton = dependencies.designSystemComponents.makeButtonImage()
    private lazy var imagePerson = dependencies.designSystemComponents.makeImageView()
    private lazy var personName = dependencies.designSystemComponents.makeLabel()
    private lazy var descriptionPerson = dependencies.designSystemComponents.makeLabel()
    private lazy var personRelated = dependencies.designSystemComponents.makeLabel()
    
    lazy var collectionView = dependencies.designSystemComponents.makeCollectionView()
    lazy var activityIndicator = dependencies.designSystemComponents.makeActivityIndicator()

    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: CONFIG LABELS
    
    private func configureLabels() {

        personName.setDTO(.init(
            text: "",
            textColor: DSColors.titleTextColor,
            font: DSFonts.subtitleSemibold16,
            numberOfLines: 0,
            textAlignment: .center
        ))

        descriptionPerson.setDTO(.init(
            text: "",
            textColor: DSColors.titleTextColor,
            font: DSFonts.captionLight14,
            numberOfLines: 0,
            textAlignment: .left
        ))

        personRelated.setDTO(.init(
            text: "More characters",
            textColor: DSColors.titleTextColor,
            font: DSFonts.subtitleSemibold16,
            numberOfLines: 0,
            textAlignment: .left
        ))
    }

    // MARK: BUTTONS
    
    private func configureButtons() {
        backButton.setDTO(.init(title: "<- Back", isEnable: true, font: DSFonts.subtitleSemibold16))
        backButton.onClick { [weak self] in
            self?.delegate?.actionBack()
        }

        updateFavoriteButton()

        favoritesButton.onClick { [weak self] in
            guard let self = self else { return }
            self.isFavorited.toggle()
            self.updateFavoriteButton()
            self.delegate?.actionFavoritesSave()
        }
    }

    private func updateFavoriteButton() {
        let iconName = isFavorited ? "heart.fill" : "heart"
        let dto = ImageButtonDTO(image: UIImage(systemName: iconName), tintColor: .red, isEnable: true)
        favoritesButton.setDTO(dto)
    }

    // MARK: CONFIG COLLECTIONVIEW
    func configCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }

    private func registerCells() {
        collectionView.register(
            ListCharactersCollectionViewCell.self,
            forCellWithReuseIdentifier: ListCharactersCollectionViewCell.identifier
        )
    }

    // MARK: POPULAR UI
    
    func setupView(data: SHCharacter?) {
        guard let data else { return }

        personName.text = data.name

        let fullName = data.biography.fullName.isEmpty ? "Unknown name" : data.biography.fullName
        let publisher = data.biography.publisher ?? "Unknown publisher"
        let origin = data.biography.placeOfBirth.isEmpty ? "Unknown birthplace" : data.biography.placeOfBirth

        descriptionPerson.text =
        """
        Full name: \(fullName)
        Publisher: \(publisher)
        Birthplace: \(origin)
        """

        imagePerson.setImage(from: data.images.lgImage)
    }

    // MARK: LOADING
    
    func showLoading() {
        activityIndicator.startAnimating()
        collectionView.isHidden = true
        personRelated.isHidden = true
        imagePerson.isHidden = true
        favoritesButton.isHidden = true
    }

    func hideLoading() {
        activityIndicator.stopAnimating()
        collectionView.isHidden = false
        personRelated.isHidden = false
        imagePerson.isHidden = false
        favoritesButton.isHidden = false
    }
}

extension DetailsScreen: ViewCodeProtocol {

    func setupElements() {
        [backButton, favoritesButton, personName, imagePerson, descriptionPerson,
         personRelated, collectionView, activityIndicator].forEach(addSubview)
    }

    func setupConstraints() {

        backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(25)
        }

        personName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        favoritesButton.snp.makeConstraints { make in
            make.centerY.equalTo(personName.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(24)
        }

        imagePerson.snp.makeConstraints { make in
            make.top.equalTo(personName.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.snp.width).multipliedBy(0.6)
        }

        descriptionPerson.snp.makeConstraints { make in
            make.top.equalTo(imagePerson.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        personRelated.snp.makeConstraints { make in
            make.top.equalTo(descriptionPerson.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(personRelated.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }

        activityIndicator.snp.makeConstraints { make in
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
