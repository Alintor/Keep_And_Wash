
import UIKit
class EditClothesRouter {
    private weak var rootViewController:UIViewController?
    
    init(rootViewController:UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func openColorPicker(delegate:ColorPickerDelegate) {
        if let colorPicker = PickerVC.storyboardInstance() {
            colorPicker.presenter = ColorPickerPresenter(delegate: delegate, initialColor: nil)
            rootViewController?.present(colorPicker, animated: true, completion: nil)
        }
    }
}
