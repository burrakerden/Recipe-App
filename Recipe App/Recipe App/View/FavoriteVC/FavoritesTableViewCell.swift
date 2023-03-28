//
//  FavoritesTableViewCell.swift
//  Recipe App
//
//  Created by Burak Erden on 10.03.2023.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
