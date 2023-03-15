//
//  MainTabBarVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        changeHeightOfTabBar()
    }
    
    func changeHeightOfTabBar() {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 90
            tabFrame.origin.y = view.frame.size.height - 80
            tabBar.frame = tabFrame
        }
    }
    
    func setupUI() {
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: SearchVC())
        let vc3 = UINavigationController(rootViewController: NewVC())
        let vc4 = UINavigationController(rootViewController: FavoritesVC())
        let vc5 = UINavigationController(rootViewController: SettingsVC())
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "plus.square.fill")
        vc4.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc5.tabBarItem.image = UIImage(systemName: "person.crop.square.fill")
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "New"
        vc4.title = "Favorites"
        vc5.title = "Settings"
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        tabBar.tintColor = .systemRed
        tabBar.backgroundColor = .systemGray4
        radius()
    }
    
    func radius() {
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}




