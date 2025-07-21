//
//  DSButton.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

protocol Buttoning: UIView {
    func setDTO(_ dto: ButtonDTO)
    func onClick(_ action: @escaping () -> Void)
}

class DSButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
        self.backgroundColor = DSColors.secondaryColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class DSButtonAdapter: DSButton, Buttoning {
    private var onClickAction: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDTO(_ dto: ButtonDTO) {
        self.setTitle(dto.title, for: .normal)
        self.isEnabled = dto.isEnable
        self.alpha = dto.isEnable ? 1 : 0.5
        if let font = dto.font {
            self.titleLabel?.font = font
        }
    }
    
    func onClick(_ action: @escaping () -> Void) {
        self.onClickAction = action
    }
    
    @objc private func didTap() {
        onClickAction?()
    }
    
    
}


class DSButtonTitles: UIButton {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




final class DSButtonTitlesAdapter: DSButtonTitles, Buttoning {
    
    private var onClickAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDTO(_ dto: ButtonDTO) {
        self.setTitle(dto.title, for: .normal)
        self.isEnabled = dto.isEnable
        self.alpha = dto.isEnable ? 1 : 0.5
        if let font = dto.font {
            self.titleLabel?.font = font
        }
    }
    
    func onClick(_ action: @escaping () -> Void) {
        self.onClickAction = action
    }
    
    @objc private func didTap() {
        onClickAction?()
    }
    
    
}

//MARK: - Button in Image
protocol ButtonImageing: AnyObject {
    func setDTO(_ dto: ImageButtonDTO)
    func onClick(_ action: @escaping () -> Void)
}

final class DSButtonImageAdapter: UIButton, ButtonImageing {
  
    
    
    private var onClickAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDTO(_ dto: ImageButtonDTO) {
        self.setImage(dto.image, for: .normal)
        self.tintColor = dto.tintColor
        self.isEnabled = dto.isEnable
        self.alpha = dto.isEnable ? 1 : 0.5
    }
    
    func onClick(_ action: @escaping () -> Void) {
        self.onClickAction = action
    }
    
    @objc private func didTap() {
        onClickAction?()
    }
    
}


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
