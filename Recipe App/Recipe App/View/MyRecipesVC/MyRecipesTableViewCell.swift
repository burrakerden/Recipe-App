//
//  FavoritesTableViewCell.swift
//  Recipe App
//
//  Created by Burak Erden on 10.03.2023.
//

import UIKit

class MyRecipesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myCategory: UILabel!
    @IBOutlet weak var myDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
