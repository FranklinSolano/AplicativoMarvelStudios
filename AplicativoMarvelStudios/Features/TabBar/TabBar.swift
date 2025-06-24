//
//  TabBar.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
class TabbarViewController: UITabBarController {
    
    private let homeFactory: HomeFactory
    private let favoritesFactory: FavoritesFactory
    private let profileFactory: ProfileFactory
    
    init(homeFactory: HomeFactory, favoritesFactory: FavoritesFactory, profileFactory: ProfileFactory) {
        self.homeFactory = homeFactory
        self.favoritesFactory = favoritesFactory
        self.profileFactory = profileFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não implementado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarController()
    }
    
    private func setupTabbarController() {
        // Criar os view controllers via factory e colocar cada um dentro de um UINavigationController
        
        
        let homeNav = UINavigationController()
        homeNav.setNavigationBarHidden(true, animated: false)
        let homeVC = homeFactory.make(navigationController: homeNav )
        homeNav.viewControllers = [homeVC]
        
        
        
        let favoritosNav = UINavigationController()
        favoritosNav.setNavigationBarHidden(true, animated: false)
        let favoritesVC = favoritesFactory.make(navigationController: favoritosNav )
        favoritosNav.viewControllers = [favoritesVC]
        
        
        
        let profileNav = UINavigationController()
        profileNav.setNavigationBarHidden(true, animated: false)
        let profileVC = profileFactory.make(navigationController: profileNav )
        profileNav.viewControllers = [profileVC]
        
        
        setViewControllers([homeNav, favoritosNav, profileNav], animated: false)
        
        tabBar.backgroundColor = DSColors.secundaryColor
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        UITabBar.appearance().tintColor = .white
        
        guard let tabBarItem = tabBar.items else { return }
        
        tabBarItem[0].title = "Home"
        tabBarItem[0].image = UIImage(systemName: "house")
        
        tabBarItem[1].title = "Favorites"
        tabBarItem[1].image = UIImage(systemName: "heart.fill")
        
        tabBarItem[2].title = "Profile"
        tabBarItem[2].image = UIImage(systemName: "person.circle.fill")
    }
}
