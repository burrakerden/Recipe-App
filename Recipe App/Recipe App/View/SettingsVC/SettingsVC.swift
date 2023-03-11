//
//  SettingsVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class SettingsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
    }
}
