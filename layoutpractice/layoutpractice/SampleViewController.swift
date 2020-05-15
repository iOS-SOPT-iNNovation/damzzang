//
//  SampleViewController.swift
//  layoutpractice
//
//  Created by 최은지 on 16/05/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit
import Layout

class SampleViewController: UIViewController, LayoutLoading, UITabBarControllerDelegate  {

    private var selectedTab = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadLayout(
            named: "Sample2.xml"
        )
    }
    
    func layoutDidLoad(_ layoutNode: LayoutNode) {
        guard let tabBarController = layoutNode.viewController as? UITabBarController else {
            return
        }

        tabBarController.selectedIndex = selectedTab
        tabBarController.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = tabBarController.viewControllers?.index(of: viewController) else {
            return
        }
        selectedTab = index
    }
    

}
