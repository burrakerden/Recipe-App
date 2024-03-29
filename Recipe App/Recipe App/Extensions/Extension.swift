//
//  File.swift
//  Recipe App
//
//  Created by Burak Erden on 10.03.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}


extension UITextField {
    
    // add image to textfield
    func withImage(image: UIImage, colorBorder: UIColor, imageTintColor: UIColor){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        mainView.layer.cornerRadius = 5
        //view for image
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = .systemGray6
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(1)
        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)
        //image
        let imageView = UIImageView(image: image)
        imageView.tintColor = imageTintColor
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        
        self.leftViewMode = .always
        self.leftView = mainView
        //for textField
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(1)
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }
    
}


extension UIImageView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
