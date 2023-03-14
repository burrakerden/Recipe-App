//
//  HomeCollectionViewCell.swift
//  Recipe App
//
//  Created by Burak Erden on 9.03.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeDishType: UILabel!
    @IBOutlet weak var homeTotalTime: UILabel!
    @IBOutlet weak var homeKcal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // corner radius and shadow
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 7.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true

    }
    
}
