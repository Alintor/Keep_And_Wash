
import UIKit

class EditIconsCell: UITableViewCell {
    
    @IBOutlet weak var iconTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var icons = [LaundryIcon]()
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let icons = viewModel?.data as? [LaundryIcon]{
                self.icons = icons
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconTitle.text = Constants.Labels.iconsTitle
    }
}
