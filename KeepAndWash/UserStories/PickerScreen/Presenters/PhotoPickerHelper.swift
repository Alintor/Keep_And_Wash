
import UIKit

protocol PhotoPickerHelperOutput {
    func setPhotoPath(_ path:String?)
    func closeImagePicker()
}

class PhotoPickerHelper: NSObject {
    
    private let output:PhotoPickerHelperOutput?
    private var photoPath:String?
    
    init(initialPhotoPath:String?, output:PhotoPickerHelperOutput?) {
        self.output = output
        self.photoPath = initialPhotoPath
    }
    
    func getState() -> [PhotoPickerState] {
        var state = [PhotoPickerState]()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            state.append(PhotoPickerState(action: .camera,
                                          viewModel: PickerViewModel(title: Constants.Labels.cameraPickerCellTitle,
                                                                     imageName: Constants.ImageNames.cameraIcon,
                                                                     hexColor: Constants.Colors.mainColor.hex,
                                                                     isChoosen: false)))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            state.append(PhotoPickerState(action: .library,
                                          viewModel: PickerViewModel(title: Constants.Labels.photoLibraryPickerCellTitle,
                                                                     imageName: Constants.ImageNames.photoLibraryIcon,
                                                                     hexColor: Constants.Colors.mainColor.hex,
                                                                     isChoosen: false)))
        }
        
        if photoPath != nil {
            state.append(PhotoPickerState(action: .delete,
                                          viewModel: PickerViewModel(title: Constants.Labels.deletePickerCellTitle,
                                                                     imageName: Constants.ImageNames.deleteIcon,
                                                                     hexColor: Constants.Colors.mainColor.hex,
                                                                     isChoosen: false)))
        }
        
        return state
    }
    
    func deletePhoto() {
        if let path = photoPath {
            deleteAtPath(path)
        }
        output?.setPhotoPath(nil)
    }
    
    private func deleteAtPath(_ path:String) {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: path)
        } catch {
            print("Can't delete file with path:\(path)")
        }
        photoPath = nil
    }
    
    private func saveImage(_ image:UIImage) {
        if let path = photoPath {
            deleteAtPath(path)
        }
        let fileManager = FileManager.default
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(UUID().uuidString).jpg")
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        fileManager.createFile(atPath: path, contents: imageData, attributes: nil)
        photoPath = path
    }
}

extension PhotoPickerHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            saveImage(image)
            output?.closeImagePicker()
            output?.setPhotoPath(photoPath)
        }
    }
}
