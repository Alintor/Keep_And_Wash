
import UIKit

class PickerVC: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var buttonView: UIView!
    
    
    var output:PickerViewOutput?
    var viewModels = [PickerViewModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerReusableCell(PickerCell.self)
        output?.attach(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backgroundView.isHidden = false
    }
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        output?.buttonTapped()
    }
    
}

extension PickerVC: PickerViewInput {
    func setViewModels(_ viewModels: [PickerViewModel]) {
        self.viewModels = viewModels
    }
    
    func setTitle(_ title: String) {
        titleLbl.text = title
    }
    
    func hideButton() {
        buttonView.isHidden = true
    }
    
    
}

extension PickerVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath: indexPath) as PickerCell
        cell.config(viewModel: viewModels[indexPath.row])
        return cell
    }
    
}

extension PickerVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.itemTapped(index: indexPath.row)
    }
}
