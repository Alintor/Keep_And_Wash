
import UIKit

class LaundryIconsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var output:LaundryIconsViewOutput?
    
    var groupedIcons = [IconGroup]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.attachView(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LaundryIconsVC: LaundryIconsViewInput {
    func setIcons(_ icons: [IconGroup]) {
        groupedIcons = icons
    }
}

extension LaundryIconsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedIcons.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedIcons[section].icons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupedIcons[section].category.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icon = groupedIcons[indexPath.section].icons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = icon.desc
        return cell
    }
}
