//
//  SignUpVC.swift
//  Recipe App
//
//  Created by Burak Erden on 17.03.2023.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var fullNameTextFied: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        fullNameTextFied.withImage(image: UIImage(systemName: "person")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        emailTextField.withImage(image: UIImage(systemName: "mail")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        passwordTextField.withImage(image: UIImage(systemName: "key")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        confirmEmailTextField.withImage(image: UIImage(systemName: "key")!, colorBorder: UIColor.systemGray6, imageTintColor: .systemGray)
        hideKeyboardWhenTappedAround()
    }


    @IBAction func signUpBottonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func appleSignUpTapped(_ sender: UIButton) {
    }
    
    @IBAction func googleSignUpTapped(_ sender: UIButton) {
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
