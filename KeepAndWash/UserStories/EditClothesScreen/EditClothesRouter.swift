
import UIKit
class EditClothesRouter {
    private weak var viewController:UIViewController?
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func openColorPickerWith(intialColor:String?, output:ColorPickerOutput) {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: pickerVC)
        let presenter = ColorPickerPresenter(initialColor: intialColor, output: output)
        presenter.router = router
        pickerVC.presenter = presenter
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openIconsPickerWith(initialIcons:[LaundryIcon]?, output:IconsPickerOutput) {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: pickerVC)
        let presenter = IconsPickerPresenter(service: LaundryIconServiceImpl(),
                                             intitialIcons: initialIcons,
                                             output: output)
        presenter.router = router
        pickerVC.presenter = presenter
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
}
