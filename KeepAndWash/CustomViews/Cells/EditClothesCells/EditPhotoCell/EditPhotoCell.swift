
import UIKit

class EditPhotoCell: UITableViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    var viewModel:EditClothesViewModel? {
        didSet {
            if let path = viewModel?.data as? String {
                photoImage.image = UIImage(contentsOfFile: path)
            }
        }
    }
    
}
