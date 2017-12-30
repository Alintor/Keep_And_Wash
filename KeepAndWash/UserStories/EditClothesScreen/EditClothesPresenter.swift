
import Foundation

protocol EditClothesView: NSObjectProtocol {
    func setViewModels(_ viewModels:[EditClothesViewModel])
    func showAlertWith(text:String)
    func openColorPicker()
    func openIconsPicker()
    func openTypesPicker()
    func openPhotoPicker()
    func openTextWriterWith(placeholder:String, callback:@escaping (_ text:String)->())
    
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
        
        viewModels.append(EditClothesViewModel(type: .title, data: clothesTitle, callback: { [unowned self] in
            self.view?.openTextWriterWith(placeholder: Constants.Placeholders.enterTitle, callback: { (title) in
                self.clothesTitle = title
                self.updateViewModels()
            })
        }))
        
        
        let typeCallback:()->() = { [unowned self] in
            self.view?.openTypesPicker()
        }
        if let type = clothesType {
            viewModels.append(EditClothesViewModel(type: .type, data: type, callback: typeCallback))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, data: Constants.ButtonTitles.chooseType, callback: typeCallback))
        }
        
        
        viewModels.append(EditClothesViewModel(type: .color, data: clothesColor, callback: { [unowned self] in
            self.view?.openColorPicker()
        }))
        
        let iconsCallback:()->() = { [unowned self] in
            self.view?.openIconsPicker()
        }
        
        if clothesIcons.count != 0 {
            viewModels.append(EditClothesViewModel(type: .icons, data: clothesIcons, callback: iconsCallback))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, data: Constants.ButtonTitles.chooseIcons, callback: iconsCallback))
        }
        
        
        let photoCallback:()->() = { [unowned self] in
            self.view?.openPhotoPicker()
        }
        
        if let path = clothesPhotoPath {
            viewModels.append(EditClothesViewModel(type: .icons, data: path, callback: photoCallback))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, data: Constants.ButtonTitles.chooseIcons, callback: photoCallback))
        }
        
        
        let noteCallback:()->() = { [unowned self] in
            self.view?.openTextWriterWith(placeholder: Constants.Placeholders.enterNote, callback: { (note) in
                self.clothesNote = note
                self.updateViewModels()
            })
        }
        
        if let note = clothesNote {
            viewModels.append(EditClothesViewModel(type: .note, data: note, callback: noteCallback))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, data: Constants.ButtonTitles.chooseIcons, callback: noteCallback))
        }
        
        self.view?.setViewModels(viewModels)
    }
    
    func saveChanges() {
        
    }
    
    
}
