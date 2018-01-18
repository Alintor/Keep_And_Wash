
import UIKit

class ClothesTypePickerModuleAssembly {
    static func getModuleWith(initialType:ClothesType?, output:ClothesTypePickerOutput) -> UIViewController {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: pickerVC)
        let presenter = ClothesTypePickerPresenter(service: ClothesServiceImpl(),
                                                   initialType: initialType,
                                                   output: output)
        presenter.router = router
        pickerVC.output = presenter
        return pickerVC
    }
}
