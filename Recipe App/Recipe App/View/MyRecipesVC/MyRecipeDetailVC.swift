//
//  FavDetailVC.swift
//  Recipe App
//
//  Created by Burak Erden on 29.03.2023.
//

import UIKit

class MyRecipeDetailVC: UIViewController {
        
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
    }

}


