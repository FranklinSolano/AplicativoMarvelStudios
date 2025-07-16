//
//  DSCollectionView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

protocol CollectionViewing: AnyObject {
    var view: UIView { get }
    var delegate: UICollectionViewDelegate? { get set }
    var dataSource: UICollectionViewDataSource? { get set }
    func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)
}

class DSCollectionView: UICollectionView {
    
    init(scroll: UICollectionView.ScrollDirection = .vertical, spacing: CGFloat){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scroll
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

final class DSCollectionViewAdapter: DSCollectionView, CollectionViewing {
    var view: UIView { return self }
}
