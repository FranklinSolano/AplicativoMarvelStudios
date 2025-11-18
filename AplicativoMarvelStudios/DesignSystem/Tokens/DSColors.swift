//
//  DSColors.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

enum DSColors {
    
    static let primaryColor: UIColor = {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark
            ? UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)  // Dark mode
            : UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1) // Light mode
        }
    }()
    
    static let secondaryColor: UIColor = {
        return UIColor { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(red: 8/255, green: 127/255, blue: 1/255, alpha: 1)
            default:
                return UIColor(red: 40/255, green: 180/255, blue: 35/255, alpha: 1) // #3A69D7
            }
        }
    }()
    
    static let titleTextColor: UIColor = {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark
            ? .white
            : .black
        }
    }()
}

final class ThemeManager {
    
    enum Theme: String {
        case light, dark
    }
    
    static let shared = ThemeManager()
    
    private let key = "selectedTheme"
    
    var currentTheme: Theme {
        if let saved = UserDefaults.standard.string(forKey: key),
           let theme = Theme(rawValue: saved) {
            return theme
        }
        return .dark
    }
    
    func applyTheme(to window: UIWindow?) {
        window?.overrideUserInterfaceStyle = currentTheme == .dark ? .dark : .light
    }
    
    func setTheme(_ theme: Theme) {
        UserDefaults.standard.setValue(theme.rawValue, forKey: key)
        // Aplica imediatamente no app
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.overrideUserInterfaceStyle = theme == .dark ? .dark : .light
        }
    }
}
