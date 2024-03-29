//
//  DetailVC.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit
import Kingfisher
import SafariServices
import CoreData

class DetailVC: UIViewController {
    
    // Fav Button
    var favoriteButtonItem: UIBarButtonItem?
    var isFavorite: Bool = false
    var favoriteImage: UIImage {
        return UIImage(systemName: "heart" + (isFavorite ? ".fill" : ""))!
    }
    
    // Core Data
    var model = CoreDataModel()
    var item: Items?
    var recipeData: Hit?
    var indexPath = 0
    
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
        model.fetchData(tableView: nil)
    }
    
    
    @IBAction func detailUrlButtonTapped(_ sender: UIButton) {
        if recipeData != nil {
            guard let directionURL = recipeData?.recipe?.url else {return}
            if let url = URL(string: directionURL) {
                let vc = SFSafariViewController(url: url)
                present(vc, animated: true)
            }
        } else {
            guard let itemURL = item?.directions else {return}
            if let url = URL(string: itemURL) {
                let vc = SFSafariViewController(url: url)
                present(vc, animated: true)
            }
        }
    }
    
    func config() {
        navigationController?.navigationBar.tintColor = .systemGray
        favButton()
        setupUI()
        detailImage.roundCorners(corners: [.bottomLeft], radius: 40)
    }
    
    func setupUI() {
        if recipeData != nil {
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
        } else {
            guard let url = self.item?.image else {return}
            detailImage.kf.setImage(with: URL(string: url))
            detailName.text = item?.name
            detailIngredients.text = item?.ingredients
            detailCuisineType.text = item?.cuisineType
            detailMealType.text = item?.mealType
            detailMacros.text = item?.macros
            detailUrlButton.setTitle("\(item?.directions ?? "Sorry, The site is unreachable right now")", for: UIControl.State.normal)
        }
    }
    
    // Favorite Button
    
    func favButton() {
        favoriteButtonItem = UIBarButtonItem(image: favoriteImage,
                                             style: .plain,
                                             target: self,
                                             action: #selector(toggleFavorite))
        favoriteButtonItem?.tintColor = .systemRed
        navigationItem.rightBarButtonItem = favoriteButtonItem
    }
    
    @objc func toggleFavorite() {
        if isFavorite {
            // delete from coredata
            print(indexPath)
            model.deleteData(indexPath: indexPath)
        } else {
            //add to coredata
            guard let recipeData = recipeData?.recipe, let url = recipeData.image, let macroData = recipeData.totalNutrients else {return}
            var detailMacrosText = ""
            let macros = ["Fat": "FAT", "Carbs": "CHOCDF", "Fiber": "FIBTG", "Sugar": "SUGAR", "Protein": "PROCNT", "Cholesterol": "CHOLE"]
            for (title, macro) in macros {
                let quantity = String(format: "%.2f", macroData[macro]?.quantity ?? 0.0)
                let unit = macroData[macro]?.unit?.rawValue ?? ""                       //look at this algorithm
                detailMacrosText += "• \(title): \(quantity) \(unit)\n"
            }
            
            model.addData(name: recipeData.label ?? "",
                          ingredients: recipeData.ingredientLines?.map { "• \($0)" }.joined(separator: "\n") ?? "",
                          cuisineType: "Origin: \(recipeData.cuisineType?[0].uppercased() ?? "UNKNOWN")",
                          mealType: recipeData.dishType?[0].capitalized ?? "",
                          directions: "\(recipeData.url ?? "Sorry, The site is unreachable right now")",
                          macros: detailMacrosText,
                          image: url,
                          yields: String(recipeData.yield ?? 0),
                          calories: String(format: "%.0f", recipeData.calories ?? 0.0) + " Kcal"
        )}
        isFavorite = !isFavorite
        favoriteButtonItem?.image = favoriteImage
    }

}


