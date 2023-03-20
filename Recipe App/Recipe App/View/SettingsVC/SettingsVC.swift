//
//  SettingsVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error on signing out")
        }
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            scene.checkUser()
        }
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
    }
}
