

import UIKit

class ClothesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var output: ClothesViewOutput?
    var clothes = [Clothes]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Icons", style: .plain, target: self, action: #selector(showIconsTapped))
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addClothesTapped))
        
        tableView.registerReusableCell(ClothesSwipeableCell.self)
        
        output?.attachView(self)
    }

    @objc func showIconsTapped(_ sender: Any) {
        output?.showIcons()
    }
    
    @objc func addClothesTapped(_ sender: Any) {
        output?.addNewClothes()
    }
}

extension ClothesVC: ClothesViewInput {
    func setClothes(_ clothes: [Clothes]) {
        tableView.isHidden = false
        self.clothes = clothes
    }
    
    func setEmptyClothes() {
        tableView.isHidden = true
    }
}

extension ClothesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = clothes[indexPath.row]
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ClothesSwipeableCell
        cell.configure(clothes: item, delegate: self)
        return cell
    }
}

extension ClothesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = clothes[indexPath.row]
        //output?.editClothes(item)
    }
}

extension ClothesVC: ClothesSwipeableCellDelegate {
    func manageDirty(sender: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            output?.markClothes(clothes[indexPath.row])
        }
    }
    
    func editClothes(sender: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            output?.editClothes(clothes[indexPath.row])
        }
    }
    
    func deleteClothes(sender: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            output?.deleteClothes(clothes[indexPath.row])
        }
    }
    
    
}
