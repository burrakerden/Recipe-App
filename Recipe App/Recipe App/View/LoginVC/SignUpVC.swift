//
//  SignUpVC.swift
//  Recipe App
//
//  Created by Burak Erden on 17.03.2023.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpVC: UIViewController {
    
    @IBOutlet weak var fullNameTextFied: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        fullNameTextFied.withImage(image: UIImage(systemName: "person")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        emailTextField.withImage(image: UIImage(systemName: "mail")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        passwordTextField.withImage(image: UIImage(systemName: "key")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        confirmPasswordTextField.withImage(image: UIImage(systemName: "key")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func signUpBottonTapped(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != "" {
            if passwordTextField.text == confirmPasswordTextField.text {
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                    if error != nil {
                        self.getAlert(mesagge: error!.localizedDescription)
                    } else {
                        let vc = MainTabBarVC()
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            } else {
                getAlert(mesagge: "Passwords do not match")
            }
        } else {
            getAlert(mesagge: "Email and Password cannot be blank!")
        }
    }
    
    
    @IBAction func appleSignUpTapped(_ sender: UIButton) {
    }
    
    @IBAction func googleSignUpTapped(_ sender: UIButton) {
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Alert
    
    func getAlert(mesagge: String) {
        let ac = UIAlertController(title: "Warning", message: mesagge, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(ac, animated: true)
    }
}
