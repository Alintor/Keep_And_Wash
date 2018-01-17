
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
        pickerVC.output = presenter
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openIconsPickerWith(initialIcons:[LaundryIcon]?, output:IconsPickerOutput) {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: pickerVC)
        let presenter = IconsPickerPresenter(service: LaundryIconServiceImpl(),
                                             intitialIcons: initialIcons,
                                             output: output)
        presenter.router = router
        pickerVC.output = presenter
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openClothesTypePickerWith(initialType:ClothesType?, output:ClothesTypePickerOutput) {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PickerRouter(viewController: pickerVC)
        let presenter = ClothesTypePickerPresenter(service: ClothesServiceImpl(),
                                                   initialType: initialType,
                                                   output: output)
        presenter.router = router
        pickerVC.output = presenter
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openPhotoPickerWith(initialPhotoPath:String?, output:PhotoPickerOutput) {
        let pickerVC = PickerVC.storyboardInstance()
        let router = PhotoPickerRouter(viewController: pickerVC)
        let presenter = PhotoPickerPresenter(initialPhotoPath: initialPhotoPath, output: output)
        presenter.router = router
        pickerVC.output = presenter
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openTextInputWith(placeholder:String, initialText:String?, callback:@escaping (_ text:String)->()) {
        let textInputVC = TextInputVC.storyboardInstance()
        let router = TextInputRouter(viewController: textInputVC)
        let presenter = TextInputPresenter(placeholder: placeholder, initialText: initialText, callback: callback)
        presenter.router = router
        textInputVC.output = presenter
        viewController?.present(textInputVC, animated: true, completion: nil)
    }
}
