//
//  File.swift
//  Recipe App
//
//  Created by Burak Erden on 10.03.2023.
//

import Foundation
import UIKit


class FavoriteButton: UIButton {
    var isFavorite = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        setButtonImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        setButtonImage()
    }
    
    @objc private func didTapButton() {
        isFavorite.toggle()
        setButtonImage()
    }
    
    private func setButtonImage() {
        let image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        tintColor = isFavorite ? .red : .gray
        setImage(image, for: .normal)
    }
}

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





