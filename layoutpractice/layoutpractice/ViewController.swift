//
//  ViewController.swift
//  layoutpractice
//
//  Created by 최은지 on 16/05/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit
import Layout

struct LayoutState{
    let isSelected: Bool
}

class ViewController: UIViewController, LayoutLoading {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadLayout(
            named: "sample2.xml",
            state: LayoutState(isSelected: false),
            constants: [
                "title": "my title"
            ]
        )


    } // viewdidload

    func setSelected() {
        self.layoutNode?.setState(LayoutState(isSelected: true))
    }

}


//class ViewController: UIViewController, LayoutLoading {
//
//    var labelNode: LayoutNode!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.layoutNode = LayoutNode(
//           view: UIView.self,
//           children: [
//               LayoutNode(
//                   view: UILabel.self,
//                   expressions: [
//                       "text": "I <i>can't believe</i> this <b>actually works!</b>"
//                   ]
//               ),
//               LayoutNode(
//                   view: UILabel.self,
//                   expressions: [
//                       "text": "I <i>can't believe</i> this <b>actually works!</b>"
//                   ]
//               ),
//           ]
//       )
//    } // viewdidload
//}

