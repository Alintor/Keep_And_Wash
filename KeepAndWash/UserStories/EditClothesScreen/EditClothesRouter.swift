
import UIKit
class EditClothesRouter {
    private weak var viewController:UIViewController?
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func openColorPickerWith(intialColor:String?, output:ColorPickerOutput) {
        let colorPicker = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: colorPicker)
        let presenter = ColorPickerPresenter(initialColor: intialColor, output: output)
        presenter.router = router
        colorPicker.presenter = presenter
        viewController?.present(colorPicker, animated: true, completion: nil)
    }
}
