//
//  FavDetailVC.swift
//  Recipe App
//
//  Created by Burak Erden on 29.03.2023.
//

import UIKit
import Kingfisher

class MyRecipeDetailVC: UIViewController {
    
    var name = String()
    var image = String()
    var category = String()
    var descriptionn = String()
    var ingredients = String()
    var directions = String()
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myMealName: UILabel!
    @IBOutlet weak var myMealType: UILabel!
    @IBOutlet weak var myIngredients: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myDirections: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        myImage.roundCorners(corners: [.bottomRight], radius: 40)
        myImage.kf.setImage(with: URL(string: image))
        myMealName.text = name
        myMealType.text = category
        myIngredients.text = ingredients
        myDescription.text = descriptionn
        myDirections.text = directions
    }

}


