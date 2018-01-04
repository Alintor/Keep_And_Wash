
import Foundation

protocol EditClothesView: NSObjectProtocol {
    func setViewModels(_ viewModels:[EditClothesViewModel])
    func showAlertWith(text:String)
    func openColorPicker()
    func openIconsPicker()
    func openTypesPicker()
    func openPhotoPicker()
    //func openTextWriterWith(placeholder:String, callback:@escaping (_ text:String)->())
    
}

class EditClothesPresenter {
    
    var clothesId:String?
    var clothesTitle:String?
    var clothesColor:String?
    var clothesPhotoPath:String?
    var clothesNote:String?
    var clothesType:ClothesType?
    var clothesIcons = [LaundryIcon]()
    
    let clothesService: ClothesService
    private weak var view: EditClothesView?
    
    init(service:ClothesService = ClothesServiceImpl(), data:Clothes?, view:EditClothesView) {
        clothesService = service
        self.view = view
        
        if let data = data {
            clothesId = data.id
            clothesTitle = data.title
            clothesColor = data.color
            clothesPhotoPath = data.photoPath
            clothesNote = data.note
            clothesType = data.type
            clothesIcons = data.laundryIcons
        }
        updateViewModels()
    }
    
    private func updateViewModels() {
        
        var viewModels = [EditClothesViewModel]()
        
        viewModels.append(EditClothesViewModel(type: .title, actionType: .editTitle, data: clothesTitle))
        
        if let type = clothesType {
            viewModels.append(EditClothesViewModel(type: .type, actionType: .editType, data: type))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editType, data: Constants.ButtonTitles.chooseType))
        }
        
        viewModels.append(EditClothesViewModel(type: .color, actionType: .editColor, data: clothesColor))
        
        if clothesIcons.count != 0 {
            viewModels.append(EditClothesViewModel(type: .icons, actionType: .editIcons, data: clothesIcons))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editIcons, data: Constants.ButtonTitles.chooseIcons))
        }
        
        if let path = clothesPhotoPath {
            viewModels.append(EditClothesViewModel(type: .photo, actionType: .editPhoto, data: path))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editPhoto, data: Constants.ButtonTitles.addPhoto))
        }
        
        if let note = clothesNote {
            viewModels.append(EditClothesViewModel(type: .note, actionType: .editNote, data: note))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editNote, data: Constants.ButtonTitles.addNote))
        }
        
        self.view?.setViewModels(viewModels)
    }
    
    func viewModelAction(actionType:EditClothesVMActionsType) {
        switch actionType {
        case .editTitle:
            break
        case .editNote:
            break
        case .editColor:
            view?.openColorPicker()
        case .editIcons:
            view?.openIconsPicker()
        case .editPhoto:
            view?.openPhotoPicker()
        case .editType:
            view?.openTypesPicker()
        }
    }
    
    func saveChanges() {
        
    }
    
    
}

extension EditClothesPresenter: ColorPickerDelegate {
    func setColor(_ hexColor: String) {
        clothesColor = hexColor
        updateViewModels()
    }
    
    
}
