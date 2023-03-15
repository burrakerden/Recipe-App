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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
