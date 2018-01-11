
import UIKit
extension UIViewController {
    private class func storyboardInstancePrivate<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as! T
    }
    class func storyboardInstance() -> Self {
        return storyboardInstancePrivate()
    }
}
