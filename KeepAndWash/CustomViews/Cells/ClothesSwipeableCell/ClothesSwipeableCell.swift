

import DTModelStorage

protocol ClothesSwipeableCellDelegate: class {
    func manageDirty(sender:UITableViewCell)
    func editClothes(sender:UITableViewCell)
    func deleteClothes(sender:UITableViewCell)
}

final class ClothesSwipeableCell: UITableViewCell {
    
    private enum Constant {
        
        static let stopPosition:CGFloat = 120
    }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var sentDirtyImage: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var containerRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerLeftConstraint: NSLayoutConstraint!
    
    private var actionClosure: ClothesListViewModel.ActionClosure?
    private var model: ClothesListViewModel!
    
    private weak var delegate:ClothesSwipeableCellDelegate?
    private var previousX:CGFloat = 0
    private var isDirty = false {
        didSet {
            if isDirty {
                containerView.layer.borderWidth = 2
                containerView.layer.borderColor = UIColor.orange.cgColor
            } else {
                containerView.layer.borderWidth = 0
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
        titleLbl.text = clothes.title
        iconView.image = UIImage(named: clothes.type.imageName)
        iconView.tintColor = UIColor(hex: clothes.color)
        self.delegate = delegate
        isDirty = clothes.isDirty
    }
    
    func manageDirtyClothes() {
        isDirty = !isDirty
        delegate?.manageDirty(sender: self)
        actionClosure?(.mark, model)
    }
    
    //MARK: Buttons actions
    @IBAction func deleteBtnTapped(_ sender: Any) {
        setConstraintsToDefault()
        delegate?.deleteClothes(sender: self)
        actionClosure?(.delete, model)
    }
    
    @IBAction func editBtnTapped(_ sender: Any) {
        setConstraintsToDefault { [weak self] _ in
            guard let `self` = self else { return }
            self.delegate?.editClothes(sender: self)
            self.actionClosure?(.edit, self.model)
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
            if -deltaX < Constant.stopPosition && deltaX < self.contentView.frame.size.width - Constant.stopPosition {
                containerLeftConstraint.constant = deltaX
                containerRightConstraint.constant = -deltaX
            } else if -deltaX > Constant.stopPosition {
                containerLeftConstraint.constant = -Constant.stopPosition
                containerRightConstraint.constant = Constant.stopPosition
            }
        case .ended:
            if containerRightConstraint.constant == Constant.stopPosition {
                previousX = -Constant.stopPosition
            } else {
                if sentDirtyImage.frame.minX > 0 {
                    setConstraintsToDefault(completion: { [weak self] _ in
                        self?.manageDirtyClothes()
                    })
                } else {
                    setConstraintsToDefault()
                }
            }
        default: break
        }
    }
    
}

extension ClothesSwipeableCell: ModelTransfer {
    
    func update(with model: ClothesListViewModel) {
        self.model = model
        titleLbl.text = model.title
        iconView.image = model.image
        iconView.tintColor = model.color
        isDirty = model.isDirty
        actionClosure = model.actionClosure
    }
}
