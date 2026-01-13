//
//  DSCollectionView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//
import UIKit

// MARK: - CollectionViewing

protocol CollectionViewing: UIView {
    var delegate: UICollectionViewDelegate? { get set }
    var dataSource: UICollectionViewDataSource? { get set }
    func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)
    func reloadData()
    var isHidden: Bool { get set }
}

// MARK: - DSCollectionView

class DSCollectionView: UICollectionView {

    init(scroll: UICollectionView.ScrollDirection = .horizontal, spacing: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scroll
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        setupStyle()
        registerForTraitChanges()
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupStyle() {
        backgroundColor = DSColors.primaryColor
    }

    private func registerForTraitChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            self.backgroundColor = DSColors.primaryColor
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DSCollectionViewAdapter

final class DSCollectionViewAdapter: DSCollectionView, CollectionViewing {}
