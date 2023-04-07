//
//  CategoriesTableViewCell.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var tableName: UILabel!
    @IBOutlet weak var tableDishType: UILabel!
    @IBOutlet weak var tableSource: UILabel!
    @IBOutlet weak var tableKcal: UILabel!
    @IBOutlet weak var tableYields: UILabel!
    
    var data = Items()

    override func awakeFromNib() {
        super.awakeFromNib()
//        setupCellUI(data: data)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellUI(data: Items) {
        tableName.text = data.name
        tableSource.text = data.cuisineType
        tableKcal.text = data.calories
        tableDishType.text = data.mealType
        tableImage.kf.setImage(with: URL(string: data.image!))
        tableYields.text = data.yields
    }
    
}
