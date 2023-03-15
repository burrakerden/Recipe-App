//
//  DetailVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    
    var favBut = FavoriteButton()
    var recipeData: Hit?
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailCuisineType: UILabel!
    @IBOutlet weak var detailIngredients: UILabel!
    @IBOutlet weak var detailDirections: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.isNavigationBarHidden = false
    }
    
    func config() {
        navigationController?.navigationBar.tintColor = .systemGray
        favButton()
        setupUI()
    }
    
    func setupUI() {
        guard let recipeData = recipeData?.recipe else {return}
        if let url = recipeData.image {
            detailImage.kf.setImage(with: URL(string: url))
        }
        detailName.text = recipeData.label
        detailIngredients.text = recipeData.ingredientLines?.joined(separator: "\n")
        detailCuisineType.text = recipeData.cuisineType?[0].capitalized

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
