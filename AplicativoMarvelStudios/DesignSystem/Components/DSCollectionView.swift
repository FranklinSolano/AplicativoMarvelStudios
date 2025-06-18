//
//  DSCollectionView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

final class DSCollectionView: UICollectionView {
    
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
