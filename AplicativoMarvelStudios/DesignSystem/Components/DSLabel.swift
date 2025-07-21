//
//  DSLabel.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit


struct LabelDTO {
    let text: String
    let textColor: UIColor
    let font: UIFont
    let numberOfLines: Int
    let textAlignment: NSTextAlignment
    
    init(
        text: String,
        textColor: UIColor = DSColors.titleTextColor,
        font: UIFont = DSFonts.titleBold18,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}

protocol Labeling: UIView {
    func setDTO(_ dto: LabelDTO)
    var text: String? {get set}
}

class DSLabel: UILabel {
    func configure(_ dto: LabelDTO){
        self.text = dto.text
        self.textColor = dto.textColor
        self.font = dto.font
        self.numberOfLines = dto.numberOfLines
        self.textAlignment = dto.textAlignment
    }
}

final class DSLabelAdapter: DSLabel, Labeling {
    func setDTO(_ dto: LabelDTO) {
        configure(dto)
    }
    
    
}

