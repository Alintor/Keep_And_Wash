
import UIKit
class EditClothesRouter {
    private weak var viewController:UIViewController?
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func closeModule() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func openColorPickerWith(intialColor:String?, output:ColorPickerOutput) {
        let pickerVC = ColorPickerModuleAssembly.getModuleWith(intialColor: intialColor, output: output)
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openIconsPickerWith(initialIcons:[LaundryIcon]?, output:IconsPickerOutput) {
        let pickerVC = IconsPickerModuleAssembly.getModuleWith(initialIcons: initialIcons, output: output)
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openClothesTypePickerWith(initialType:ClothesType?, output:ClothesTypePickerOutput) {
        let pickerVC = ClothesTypePickerModuleAssembly.getModuleWith(initialType: initialType, output: output)
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openPhotoPickerWith(initialPhotoPath:String?, output:PhotoPickerOutput) {
        let pickerVC = PhotoPickerModuleAssembly.getModuleWith(initialPhotoPath: initialPhotoPath, output: output)
        viewController?.present(pickerVC, animated: true, completion: nil)
    }
    
    func openTextInputWith(placeholder:String, initialText:String?, callback:@escaping (_ text:String)->()) {
        let textInputVC = TextInputModuleAssembly.getTextInputModuleWith(placeholder: placeholder, initialText: initialText, callback: callback)
        viewController?.present(textInputVC, animated: true, completion: nil)
    }
    
    func showAlert(title:String? = nil, message:String, isToast: Bool = false) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if isToast {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                alertController.dismiss(animated: true, completion: nil)
            }
        } else {
            alertController.addAction(UIAlertAction(title: Constants.ButtonTitles.okBtn, style: .cancel, handler: nil))
        }
        viewController?.present(alertController, animated: true, completion: nil)
        
    }
}
