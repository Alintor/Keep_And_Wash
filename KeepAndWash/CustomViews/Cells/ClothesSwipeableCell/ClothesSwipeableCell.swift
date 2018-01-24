

import UIKit

protocol ClothesSwipeableCellDelegate: class {
    func manageDirty(sender:UITableViewCell)
    func editClothes(sender:UITableViewCell)
    func deleteClothes(sender:UITableViewCell)
}

class ClothesSwipeableCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var sentDirtyImage: UIImageView!
    
    @IBOutlet weak var containerRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerLeftConstraint: NSLayoutConstraint!
    
    private weak var delegate:ClothesSwipeableCellDelegate?
    private var previousX:CGFloat = 0
    private let stopPosition:CGFloat = 120
    private var isDirty = false {
        didSet {
            if isDirty {
                containerView.backgroundColor = UIColor.orange
            } else {
                containerView.backgroundColor = UIColor.white
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleSwipeCell)))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setConstraintsToDefault()
    }
    
    func configure(clothes:Clothes, delegate:ClothesSwipeableCellDelegate?) {
        self.delegate = delegate
        isDirty = clothes.isDirty
    }
    
    func manageDirtyClothes() {
        isDirty = !isDirty
        delegate?.manageDirty(sender: self)
    }
    
    //MARK: Buttons actions
    @IBAction func deleteBtnTapped(_ sender: Any) {
        setConstraintsToDefault()
        delegate?.deleteClothes(sender: self)
    }
    
    @IBAction func editBtnTapped(_ sender: Any) {
        setConstraintsToDefault { (bool) in
            self.delegate?.editClothes(sender: self)
        }
        
    }
    
    func setConstraintsToDefault(completion:((Bool)->Void)? = nil) {
        previousX = 0
        containerLeftConstraint.constant = 0
        containerRightConstraint.constant = 0
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: completion)
        
    }

    //MARK:  Swipe animation method
    @objc func handleSwipeCell(_ recognizer: UIPanGestureRecognizer) {
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
                previousX = -stopPosition
            } else {
                if sentDirtyImage.frame.minX > 0 {
                    setConstraintsToDefault(completion: { (bool) in
                        self.manageDirtyClothes()
                    })
                } else {
                    setConstraintsToDefault()
                }
                
            }
        default:
            break
        }
    }
    
}
