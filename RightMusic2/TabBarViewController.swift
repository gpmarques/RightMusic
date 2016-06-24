//
//  TabBarViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/24/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(animated: Bool) {
//        let item1 = HomeViewController()
//        let item2 = PlaylistViewController()
        let item3 = SearchViewController()
        let item4 = ProfileViewController()
        
//        let nav1 = UINavigationController(rootViewController: item1)
//        let nav2 = UINavigationController(rootViewController: item2)
        let nav3 = UINavigationController(rootViewController: item3)
        let nav4 = UINavigationController(rootViewController: item4)
        
//        let icon1 = UITabBarItem(title: "Home", image: UIImage(named: "homeTabBarIcon"), selectedImage: UIImage(named: "homeTabBarIcon"))
//        let icon2 = UITabBarItem(title: "Playlists", image: UIImage(named: "playlistTabBarIcon"), selectedImage: UIImage(named: "playlistTabBarIcon"))
        let icon3 = UITabBarItem(title: "Search", image: UIImage(named: "searchIcon"), selectedImage: UIImage(named: "searchIcon"))
        let icon4 = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), selectedImage: UIImage(named: "profileIcon"))
        
//        item1.tabBarItem = icon1
//        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        item4.tabBarItem = icon4
        
        let controllers = [nav3, nav4]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
        self.tabBar.backgroundColor = red
        self.tabBar.tintColor = dark
        self.tabBar.backgroundImage = UIImage(named: "tabbarImage")
        
    }
        
    //Delegate methods
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title) ?")
        return true
    }
}

