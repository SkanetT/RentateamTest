//
//  ListCell.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var metaDataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.cornerRadius = 8
    }
    
    override func prepareForReuse() {
        backImage.image = nil
    }
    
    func setData(data: Data?) {
        guard let data = data else { return }
        let image = UIImage(data: data)
        self.backImage.image = image
        self.metaDataLabel.text = image?.getMetaData()
    }
}
