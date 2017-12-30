
import UIKit

class EditNoteCell: UITableViewCell {
    
    @IBOutlet weak var noteLbl: UILabel!
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let note = viewModel?.data as? String {
                noteLbl.text = note
            }
        }
    }
}
