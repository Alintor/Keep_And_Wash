//
//  LaundryIconCell.swift
//  KeepAndWash
//
//  Created by Alexandr on 09/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import DTModelStorage

class LaundryIconCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LaundryIconCell: ModelTransfer {
    
    func update(with model: LaundryIconsViewModel) {
        descriptionLabel.text = model.title
        iconImageView.image = model.image
    }
}
