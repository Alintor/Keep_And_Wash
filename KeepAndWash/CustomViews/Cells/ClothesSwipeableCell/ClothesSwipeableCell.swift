

import UIKit

class ClothesSwipeableCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var sentDirtyImage: UIImageView!
    
    @IBOutlet weak var containerRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerLeftConstraint: NSLayoutConstraint!
    
    var isDirty = false
    var previousX:CGFloat = 0
    let stopPosition:CGFloat = 120
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeCell)))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setConstraintsToDeffault()
    }
    
    func manageDirty() {
        isDirty = !isDirty
        if isDirty {
            containerView.backgroundColor = UIColor.orange
        } else {
            containerView.backgroundColor = UIColor.white
        }
    }
    
    @objc func setConstraintsToDeffault() {
        previousX = 0
        containerLeftConstraint.constant = 0
        containerRightConstraint.constant = 0
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
    }

    
    @objc func swipeCell(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            let currentX = recognizer.translation(in: containerView).x
            let deltaX = currentX + previousX
            if -deltaX < stopPosition && deltaX < self.contentView.frame.size.width - stopPosition {
                containerLeftConstraint.constant = deltaX
                containerRightConstraint.constant = -deltaX
            } else if -deltaX > stopPosition {
                containerLeftConstraint.constant = -stopPosition
                containerRightConstraint.constant = stopPosition
            }
            
        case .ended:
            if containerRightConstraint.constant == stopPosition {
                previousX = -containerRightConstraint.constant
            } else {
                if sentDirtyImage.frame.minX > 0 {
                    manageDirty()
                }
                setConstraintsToDeffault()
            }
        default:
            break
        }
    }
    
}
