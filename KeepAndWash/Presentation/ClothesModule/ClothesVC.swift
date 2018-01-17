

import UIKit

class ClothesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: ClothesPresenter?
    var clothes = [Clothes]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = ClothesPresenter(view: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ClothesVC: ClothesView {
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
