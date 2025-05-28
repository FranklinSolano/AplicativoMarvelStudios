//
//  TabBar.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

class TabbarViewController: UITabBarController {

    //MARK: - Inicializador
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabbarController()
    }
    
    //MARK: - Other Methods

    private func setupTabbarController(){
        
        let home = HomeViewController()
        let favoritos = FavoritosViewController()
        let profile = ProfileViewController()
        
        setViewControllers([home,favoritos,profile], animated: false)
        
        tabBar.backgroundColor = UIColor(red: 38/255, green: 48/255, blue: 59/255, alpha: 1)
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        
        guard let tabBarItem = tabBar.items else {return}
        
        tabBarItem[0].title = "Home"
        tabBarItem[0].image = UIImage(systemName: "house")
        
        tabBarItem[1].title = "Favorites"
        tabBarItem[1].image = UIImage(systemName: "heart.fill")
        
        tabBarItem[2].title = "Profile"
        tabBarItem[2].image = UIImage(systemName: "person.circle.fill")
    }
}
