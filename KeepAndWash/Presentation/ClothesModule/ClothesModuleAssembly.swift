
import UIKit

class ClothesModuleAssembly {
    static func getModule() -> UIViewController {
        let clothesVC = ClothesVC.storyboardInstance()
        let router = ClothesRouter(viewController: clothesVC)
        let presenter = ClothesPresenter(service: ClothesServiceImpl())
        presenter.router = router
        clothesVC.output = presenter
        return clothesVC
    }
}
