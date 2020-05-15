//
//  AppDelegate.swift
//  layoutpractice
//
//  Created by 최은지 on 16/05/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit
import Layout

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
//        let vc = ApplicationViewController()
//        let nav = UINavigationController(rootViewController: vc)
//        window?.rootViewController = nav
//        window?.makeKeyAndVisible()
        
        
        return true
    }

}
