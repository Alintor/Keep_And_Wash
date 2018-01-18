
import UIKit

class PhotoPickerModuleAssembly {
    static func getModuleWith(initialPhotoPath:String?, output:PhotoPickerOutput) -> UIViewController {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PhotoPickerRouter(viewController: pickerVC)
        let presenter = PhotoPickerPresenter(initialPhotoPath: initialPhotoPath, output: output)
        presenter.router = router
        pickerVC.output = presenter
        return pickerVC
    }
}
