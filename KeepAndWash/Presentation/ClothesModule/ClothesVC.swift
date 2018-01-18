

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = item.title
        return cell
    }
}

extension ClothesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = clothes[indexPath.row]
        output?.editClothes(item)
    }
}
