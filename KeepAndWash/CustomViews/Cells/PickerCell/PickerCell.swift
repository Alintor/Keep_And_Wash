

import UIKit

class PickerCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var choosenView: UIImageView!
    
    
    func config(viewModel:PickerViewModel) {
        title.text = viewModel.title
        iconImageView.image = UIImage(named: viewModel.imageName)
        iconImageView.tintColor = UIColor(hex: viewModel.hexColor)
        choosenView.isHidden = !viewModel.isChoosen
    }

}
