//
//  AddRecipeVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class AddRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var recipeCategory: UIButton!
    @IBOutlet weak var recipeDescription: UITextView!
    @IBOutlet weak var recipeIngredients: UITextView!
    @IBOutlet weak var recipeDirection: UITextView!
    @IBOutlet weak var recipeImage: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGesture()
    }
    
    func setupUI() {
        setMainButton()
        rightButton()
        let textViews: [UITextView] = [recipeDescription, recipeIngredients, recipeDirection]
        for textView in textViews {
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.systemGray5.cgColor
            textView.layer.cornerRadius = 6
        }
        recipeImage.image = UIImage(named: "add")
    }
    
    
    func setMainButton() {
        let test = {(action: UIAction) in
            self.categorySelected()
        }
        recipeCategory.menu = UIMenu(children : [
            UIAction(title: "Breakfasts", handler: test),
            UIAction(title: "Soups", handler: test),
            UIAction(title: "Salads", handler: test),
            UIAction(title: "Appetizers", handler: test),
            UIAction(title: "Mains",state: .on, handler: test),
            UIAction(title: "Sides", handler: test),
            UIAction(title: "Desserts", handler: test),
            UIAction(title: "Snacks", handler: test),
            UIAction(title: "Drinks", handler: test)
        ])
        recipeCategory.showsMenuAsPrimaryAction = true
        recipeCategory.changesSelectionAsPrimaryAction = true
    }
    
    func categorySelected() {
        if let title = recipeCategory.currentTitle {
            print(title)
        }
    }
    
    
    //MARK: - Bar Button
    
    private func rightButton() {
        let myButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(saveTapped))
        myButton.tintColor = UIColor.systemRed
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func saveTapped() {
        print("ok")
        if recipeName.text == "" {
            getAlert(mesagge: "Please fill in the blanks")
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: - ImagePicking Gestures And Keyboard
    
    func setupGesture() {
        recipeImage.isUserInteractionEnabled = true
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(selectImageWithAlert))
        let gestureRecogniserKeyboard = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        recipeImage.addGestureRecognizer(gestureRecogniser)
        view.addGestureRecognizer(gestureRecogniserKeyboard)
    }
    
    @objc func selectImageWithAlert() {
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        ac.message = "Select Image"
        
        //MARK: - Actions
        
        let libraryAction = UIAlertAction(title: "Choose from library", style: .default) { a in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true)
        }
        libraryAction.setValue(UIImage(systemName: "photo.on.rectangle.angled"), forKey: "image")
        
        let cameraAction = UIAlertAction(title: "Take a photo", style: .default) { _ in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            self.present(picker, animated: true)
        }
        cameraAction.setValue(UIImage(systemName: "camera"), forKey: "image")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        ac.addAction(libraryAction)
        ac.addAction(cameraAction)
        ac.addAction(cancelAction)

        if recipeImage.image == UIImage(named: "add") {
            print("not selected")
        } else {
            ac.addAction(UIAlertAction(title: "Delete selected image", style: .destructive, handler: { _ in
                self.recipeImage.image = UIImage(named: "add")
            }))
        }
        present(ac, animated: true)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        recipeImage.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Alert
    
    func getAlert(mesagge: String) {
        let ac = UIAlertController(title: "Warning", message: mesagge, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
}

