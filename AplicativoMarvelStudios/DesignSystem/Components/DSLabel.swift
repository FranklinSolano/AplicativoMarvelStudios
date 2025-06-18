//
//  DSLabel.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

final class DSLabel: UILabel {

    init(text: String,textColor: UIColor = DSColors.titleTextColor,font: UIFont = DSFonts.titleBold18 ,numberOfLines: Int = 0,textAlignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
