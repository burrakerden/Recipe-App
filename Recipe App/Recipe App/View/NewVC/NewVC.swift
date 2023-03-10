//
//  NewVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class NewVC: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationItem.title = "New Recipe"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .systemGray
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let vc = AddRecipeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
