//
//  LoginVC.swift
//  Recipe App
//
//  Created by Burak Erden on 16.03.2023.
//

import UIKit

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
//        let vc = SignInVC()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let vc = SignUpVC()
        navigationController?.pushViewController(vc, animated: true)
        print("singup")
    }
    
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func appleSignInTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func googleSignInTapped(_ sender: UIButton) {
    }
    

    
}
