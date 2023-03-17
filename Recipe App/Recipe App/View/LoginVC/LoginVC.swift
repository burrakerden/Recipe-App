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
//        navigationController?.isNavigationBarHidden = true
    }

    func setupUI() {
        customizeTextField(emailTextField)
        customizeTextField(passwordTextField)
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
    
    
    
    func customizeTextField(_ textField: UITextField) {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 0))
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 2
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.masksToBounds = true
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
    }
    
}
