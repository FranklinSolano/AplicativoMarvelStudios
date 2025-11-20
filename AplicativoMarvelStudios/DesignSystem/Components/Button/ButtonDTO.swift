//
//  ButtonDTO.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/07/25.
//

import UIKit

//MARK: - ButtonDTO

struct ButtonDTO {
    let title: String
    let isEnable: Bool
    let font: UIFont?
    
    init(title: String = "",
         isEnable: Bool = true,
         font: UIFont? = nil) {
        self.title = title
        self.isEnable = isEnable
        self.font = font
    }
}

//MARK: - ImageButtonDTO

struct ImageButtonDTO {
    let image: UIImage?
    let tintColor: UIColor?
    let isEnable: Bool
    
    init(image: UIImage? = nil,
           tintColor: UIColor? = nil,
           isEnable: Bool = true) {
          self.image = image
          self.tintColor = tintColor
          self.isEnable = isEnable
      }
}
