//
//  DSSegmentedControling.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 16/07/25.
//

import UIKit

protocol SegmentedControling {
    var view: UISegmentedControl { get }
    var selectedSegmentIndex: Int { get set }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
}

// MARK: - Adapter

final class DSSegmentedControlAdapter: SegmentedControling {
    let view: UISegmentedControl
    
    var selectedSegmentIndex: Int {
        get { view.selectedSegmentIndex }
        set { view.selectedSegmentIndex = newValue }
    }
    
    init(items: [String]) {
        let control = UISegmentedControl(items: items)
        control.translatesAutoresizingMaskIntoConstraints = false
        self.view = control
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        view.addTarget(target, action: action, for: controlEvents)
    }
}
