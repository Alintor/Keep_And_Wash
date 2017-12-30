
import UIKit

class LaundryIconsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter:LaundryIconsPresenter?
    
    var groupedIcons = [IconGroup]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = LaundryIconsPresenter(view: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension LaundryIconsVC: IconsView {
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
