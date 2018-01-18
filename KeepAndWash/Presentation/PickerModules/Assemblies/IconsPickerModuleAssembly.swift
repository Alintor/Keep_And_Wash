
import UIKit

class IconsPickerModuleAssembly {
    static func getModuleWith(initialIcons:[LaundryIcon]?, output:IconsPickerOutput) -> UIViewController {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: pickerVC)
        let presenter = IconsPickerPresenter(service: LaundryIconServiceImpl(),
                                             intitialIcons: initialIcons,
                                             output: output)
        presenter.router = router
        pickerVC.output = presenter
        return pickerVC
    }
}
