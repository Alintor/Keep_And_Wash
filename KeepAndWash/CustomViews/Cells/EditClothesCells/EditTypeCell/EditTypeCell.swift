

import UIKit

class EditTypeCell: UITableViewCell {
    
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var typeIcon: UIImageView!
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let type = viewModel?.data as? ClothesType {
                typeName.text = type.title
                typeIcon.image = UIImage(named: type.imageName)
            }
        }
    }

    
}
