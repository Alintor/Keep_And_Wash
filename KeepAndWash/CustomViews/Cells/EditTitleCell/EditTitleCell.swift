
import UIKit

class EditTitleCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let title = viewModel?.data as? String {
                textField.text = title
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.placeholder = Constants.Placeholders.enterTitle
    }
    
}
