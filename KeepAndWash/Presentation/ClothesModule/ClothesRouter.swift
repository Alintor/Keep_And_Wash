
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
}
