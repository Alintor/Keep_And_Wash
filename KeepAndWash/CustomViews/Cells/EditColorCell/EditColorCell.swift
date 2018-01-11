

import UIKit

class EditColorCell: UITableViewCell {
    
    @IBOutlet weak var colorTitle: UILabel!
    @IBOutlet weak var colorIcon: UIImageView!
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let colorName = viewModel?.data as? String {
                colorIcon.image = UIImage(named: Constants.ImageNames.colorIcon)
                colorIcon.tintColor = UIColor(hex: colorName)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
       colorTitle.text = Constants.Labels.colorTitle
    }

    
}
