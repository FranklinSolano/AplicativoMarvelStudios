//
//  DS.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 16/07/25.
//

import UIKit

//MARK: - LoadingIndicatable

protocol LoadingIndicatable: UIView {
    func startAnimating()
    func stopAnimating()
    var isHidden: Bool { get set }
}

//MARK: - DSActivityIndicatorAdapter

final class DSActivityIndicatorAdapter: UIActivityIndicatorView, LoadingIndicatable {
    
    init() {
        super.init(style: .large)
        hidesWhenStopped = true
        color = DSColors.titleTextColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
