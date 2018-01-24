
import UIKit

class ClothesRouter {
    private weak var viewController:UIViewController?
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func openLaundryIconsModule() {
        let iconsVC = LaundryIconsModuleAssembly.getModule()
        viewController?.navigationController?.pushViewController(iconsVC, animated: true)
    }
    
    func openEditClothesModuleWith(clothes:Clothes?) {
        let editVC = EditClothesModuleAssembly.getModuleWith(clothes: clothes)
        viewController?.navigationController?.pushViewController(editVC, animated: true)
    }
    
    func showDeleteAlert(title:String, message:String, action:@escaping ()->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.ButtonTitles.cancelBtn, style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: Constants.ButtonTitles.deleteBtn, style: .destructive, handler: { (alertAction) in
            action()
        }))
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
