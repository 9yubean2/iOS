//
//  NewSceneDelegate.swift
//  Chapter03-TabBar
//
//  Created by 이규빈 on 2022/04/30.
//

import UIKit

class NewSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //create Tab Bar Controller & set background color white
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        //set Tab Bar Controller to rootView
        self.window?.rootViewController = tbC
        
        //create view controller object connect with tab bar item
        let view01 = ViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        //set view controller object to register in tab bar controller
        tbC.setViewControllers([view01, view02, view03], animated: false)
        
        //set attribute each tab bar item properties
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)

        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)

    }
}
