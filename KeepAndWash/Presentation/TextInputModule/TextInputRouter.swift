
import UIKit

class TextInputRouter {
    private let viewController: UIViewController
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func closeModule() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
