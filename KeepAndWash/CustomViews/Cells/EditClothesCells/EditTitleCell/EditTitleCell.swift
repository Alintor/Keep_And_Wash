
import UIKit

class EditTitleCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let title = viewModel?.data as? String {
                titleLbl.text = title
            }
        }
    }
}
