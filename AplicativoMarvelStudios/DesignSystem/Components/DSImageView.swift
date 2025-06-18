//
//  DSImageView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//
import UIKit

final class DSImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: .placeholder)
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupImage() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
    }
}
