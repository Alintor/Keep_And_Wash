
import UIKit

class EditClothesModuleAssembly {
    static func getModuleWith(clothes:Clothes?) -> UIViewController {
        let editClothesVC = EditClothesVC.storyboardInstance()
        let router = EditClothesRouter(viewController: editClothesVC)
        let presenter = EditClothesPresenter(service: ClothesServiceImpl(), clothes: clothes)
        presenter.router = router
        editClothesVC.output = presenter
        return editClothesVC
    }
}
