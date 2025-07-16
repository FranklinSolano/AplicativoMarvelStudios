//
//  DSButton.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

protocol Buttoning: AnyObject {
    var view: UIView { get }
    var title: String? { get set }
    var isEnabled: Bool { get set }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
}

 class DSButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
        self.backgroundColor = DSColors.secondaryColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.isEnabled = true
        self.alpha = 05
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class DSButtonAdapter: DSButton, Buttoning {
    var view: UIView { return self }
    
    var title: String? {
        get { return self.title(for: .normal) }
        set { self.setTitle(newValue, for: .normal) }
    }
}

 class DSButtonTitles: UIButton {
    
    init(title: String, font: UIFont) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
        self.titleLabel?.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

final class DSButtonTitlesAdapter: DSButtonTitles, Buttoning {
    var view: UIView { return self }
    
    var title: String? {
        get { return self.title(for: .normal) }
        set { self.setTitle(newValue, for: .normal) }
    }
}
