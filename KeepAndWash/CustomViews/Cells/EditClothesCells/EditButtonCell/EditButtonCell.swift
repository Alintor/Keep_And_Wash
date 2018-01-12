
import UIKit

class EditButtonCell: UITableViewCell {
    
    @IBOutlet weak var buttonTiitleLbl: UILabel!
    
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let title = viewModel?.data as? String {
                buttonTiitleLbl.text = title
            }
        }
    }
    
}
