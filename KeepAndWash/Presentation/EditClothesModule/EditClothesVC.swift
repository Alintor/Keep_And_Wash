
import UIKit

class EditClothesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:Clothes?
    var output:EditClothesViewOutput?
    var viewModels = [EditClothesViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.attachView(self)
        
        tableView.registerReusableCell(EditTitleCell.self)
        tableView.registerReusableCell(EditNoteCell.self)
        tableView.registerReusableCell(EditTypeCell.self)
        tableView.registerReusableCell(EditColorCell.self)
        tableView.registerReusableCell(EditIconsCell.self)
        tableView.registerReusableCell(EditPhotoCell.self)
        tableView.registerReusableCell(EditButtonCell.self)
    }
}

extension EditClothesVC: EditClothesViewInput {
    func setViewModels(_ viewModels: [EditClothesViewModel]) {
        self.viewModels = viewModels
    }
    
    func showAlertWith(text: String) {
        
    }
}

extension EditClothesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        
        switch viewModel.type {
        case .button:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EditButtonCell
            cell.viewModel = viewModel
            return cell
            
        case .color:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EditColorCell
            cell.viewModel = viewModel
            return cell
            
        case .icons:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EditIconsCell
            cell.viewModel = viewModel
            return cell
            
        case .note:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EditNoteCell
            cell.viewModel = viewModel
            return cell
            
        case .photo:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EditPhotoCell
            cell.viewModel = viewModel
            return cell
            
        case .title:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EditTitleCell
            cell.viewModel = viewModel
            return cell
            
        case .type:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EditTypeCell
            cell.viewModel = viewModel
            return cell
            
        }
        
    }
}

extension EditClothesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.viewModelAction(actionType: viewModels[indexPath.row].actionType)
    }
}
