//
//  DetailVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class DetailVC: UIViewController {
    
    var favBut = FavoriteButton()
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var detailIngredients: UILabel!
    @IBOutlet weak var detailDirections: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupUI() {
        navigationController?.navigationBar.tintColor = .systemGray
        favButton()
    }
    
    func favButton() {
        
        let favoriteButton = FavoriteButton(frame: CGRect(x: 340, y: 380, width: 44, height: 44))
        view.addSubview(favoriteButton)
        favoriteButton.addTarget(self, action: #selector(test), for: .allTouchEvents)
    }
    
    @objc func test() {
        print(favBut.isFavorite)
    }
}
