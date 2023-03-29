//
//  DetailVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Kingfisher
import SafariServices

class DetailVC: UIViewController {
    
    var favBut = FavoriteButton()
    var recipeData: Hit?
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailCuisineType: UILabel!
    @IBOutlet weak var detailIngredients: UILabel!
    @IBOutlet weak var detailDirections: UILabel!
    @IBOutlet weak var detailMacros: UILabel!
    @IBOutlet weak var detailUrlButton: UIButton!
    
    
    @IBOutlet weak var detailMealType: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func detailUrlButtonTapped(_ sender: UIButton) {
        guard let recipeData = recipeData?.recipe?.url else {return}
        if let url = URL(string: recipeData) {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    
    func config() {
        navigationController?.navigationBar.tintColor = .systemGray
        favButton()
        setupUI()
        detailImage.roundCorners(corners: [.bottomLeft], radius: 40)
    }
    
    func setupUI() {
        guard let recipeData = recipeData?.recipe, let url = recipeData.image, let macroData = recipeData.totalNutrients else {return}
        detailImage.kf.setImage(with: URL(string: url))
        detailName.text = recipeData.label
        detailIngredients.text = recipeData.ingredientLines?.map { "• \($0)" }.joined(separator: "\n")
        detailCuisineType.text = "Origin: \(recipeData.cuisineType?[0].uppercased() ?? "UNKNOWN")"
        detailMealType.text = recipeData.mealType?[0].capitalized
        detailUrlButton.setTitle("\(recipeData.url ?? "Sorry, The site is unreachable right now")", for: UIControl.State.normal)
        
        var detailMacrosText = ""
        let macros = ["Fat": "FAT", "Carbs": "CHOCDF", "Fiber": "FIBTG", "Sugar": "SUGAR", "Protein": "PROCNT", "Cholesterol": "CHOLE"]
        for (title, macro) in macros {
            let quantity = String(format: "%.2f", macroData[macro]?.quantity ?? 0.0)
            let unit = macroData[macro]?.unit?.rawValue ?? ""                       //look at this algorithm
            detailMacrosText += "• \(title): \(quantity) \(unit)\n"
        }
        detailMacros.text = detailMacrosText
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
