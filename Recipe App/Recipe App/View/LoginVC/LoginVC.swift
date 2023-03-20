//
//  LoginVC.swift
//  Recipe App
//
//  Created by Burak Erden on 16.03.2023.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    func setupUI() {
        emailTextField.withImage(image: UIImage(systemName: "mail")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        passwordTextField.withImage(image: UIImage(systemName: "key")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        hideKeyboardWhenTappedAround()
    }

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdata, error in
                if error != nil {
                    self.getAlert(mesagge: error!.localizedDescription)
                } else {
                    let vc = MainTabBarVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        } else {
            getAlert(mesagge: "Email and Password cannot be blank!")
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let vc = SignUpVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func appleSignInTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func googleSignInTapped(_ sender: UIButton) {
    }
    

    func getAlert(mesagge: String) {
        let ac = UIAlertController(title: "Warning", message: mesagge, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(ac, animated: true)
    }

}
