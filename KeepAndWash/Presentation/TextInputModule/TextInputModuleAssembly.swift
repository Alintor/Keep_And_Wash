
import UIKit
class TextInputModuleAssembly {
    static func getTextInputModuleWith(placeholder:String, initialText:String?, callback:@escaping (_ text:String)->()) -> UIViewController {
        let textInputVC = TextInputVC.storyboardInstance()
        let router = TextInputRouter(viewController: textInputVC)
        let presenter = TextInputPresenter(placeholder: placeholder, initialText: initialText, callback: callback)
        presenter.router = router
        textInputVC.output = presenter
        return textInputVC
    }
}
