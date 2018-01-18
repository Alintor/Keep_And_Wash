import UIKit
class PhotoPickerRouter: PickerRouter {
    
    func openPhotoLibrary(delegate:UIImagePickerControllerDelegate&UINavigationControllerDelegate) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = delegate
            imagePicker.sourceType = .photoLibrary;
            viewController.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openCamera(delegate:UIImagePickerControllerDelegate&UINavigationControllerDelegate) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = delegate
            imagePicker.sourceType = .camera;
            viewController.present(imagePicker, animated: true, completion: nil)
        }
    }
    
}
