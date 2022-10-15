//
//  PrivacyViewController.swift
//  WeatherApp_Zooey
//
//  Created by zooey on 2022/10/10.
//

import UIKit

// 개인정보보호정책
class PrivacyViewController: UIViewController {

    @IBOutlet weak var selectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectButton.layer.cornerRadius = 10
    }
    
    @IBAction func selectionButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}