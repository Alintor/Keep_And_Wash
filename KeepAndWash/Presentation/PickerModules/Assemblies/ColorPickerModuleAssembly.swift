
import UIKit

class ColorPickerModuleAssembly {
    static func getModuleWith(intialColor:String?, output:ColorPickerOutput) -> UIViewController {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: pickerVC)
        let presenter = ColorPickerPresenter(initialColor: intialColor, service: HexColorServiceImpl(), output: output)
        presenter.router = router
        pickerVC.output = presenter
        return pickerVC
    }
}
