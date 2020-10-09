//
//  ViewController.swift
//  fontpicker
//
//  Created by 최은지 on 2020/10/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mylabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        let configuration = UIFontPickerViewController.Configuration()
        configuration.includeFaces = true
        
        let fontPicker = UIFontPickerViewController(configuration: configuration)
        fontPicker.delegate = self
        
        present(fontPicker, animated: true, completion: nil)
    }
}

extension ViewController: UIFontPickerViewControllerDelegate {
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let descriptor = viewController.selectedFontDescriptor else { return }
        let font = UIFont(descriptor: descriptor, size: 17)
        self.mylabel.font = font
    }
    
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        print("cancel")
    }
}
