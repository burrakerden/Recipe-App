//
//  SettingsVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {
    
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        userEmail.text = Auth.auth().currentUser?.email
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
        guard let user = Auth.auth().currentUser else {return}
        user.delete { error in
            if let error = error {
                print("Error while deleting account \(error.localizedDescription)")
            } else {
                print("Account deleted successfully")
            }
        }
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            scene.checkUser()
        }
    }
}
