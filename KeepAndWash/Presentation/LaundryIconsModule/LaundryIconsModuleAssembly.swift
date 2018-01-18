
import UIKit

class LaundryIconsModuleAssembly {
    static func getModule() -> UIViewController {
        let iconsVC = LaundryIconsVC.storyboardInstance()
        let presenter = LaundryIconsPresenter(service: LaundryIconServiceImpl())
        iconsVC.output = presenter
        return iconsVC
    }
}
