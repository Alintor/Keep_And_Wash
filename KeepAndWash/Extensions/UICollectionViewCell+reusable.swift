
import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String { return String(describing: self) }
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
