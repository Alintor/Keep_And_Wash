
import UIKit

class PickerVC: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    
    var presenter:PickerPresenter?
    var viewModels = [PickerViewModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerReusableCell(PickerCell.self)
        presenter?.attach(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backgroundView.isHidden = false
    }

}

extension PickerVC: PickerView {
    func setViewModels(_ viewModels: [PickerViewModel]) {
        self.viewModels = viewModels
    }
    
    func setTitle(_ title: String) {
        titleLbl.text = title
    }
    
    func hideButton() {
        
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
        presenter?.itemTapped(index: indexPath.row)
    }
}
