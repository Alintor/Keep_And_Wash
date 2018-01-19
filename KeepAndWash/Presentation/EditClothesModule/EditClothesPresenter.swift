
import Foundation

protocol EditClothesViewInput: class {
    func setViewModels(_ viewModels:[EditClothesViewModel])
}

protocol EditClothesViewOutput {
    func attachView(_ view:EditClothesViewInput )
    func viewModelAction(actionType:EditClothesVMActionsType)
    func saveChanges()
}

class EditClothesPresenter: EditClothesViewOutput {
    
    private let state: EditClothesState
    let clothesService: ClothesService
    let builder:EditClothesVMBuilder
    private weak var view: EditClothesViewInput?
    var router: EditClothesRouter?
    
    init(service:ClothesService, clothes:Clothes?) {
        clothesService = service
        state = EditClothesState(clothes: clothes)
        builder = EditClothesVMBuilder(state: state)
    }
    
    private func updateViewModels() {
        
        self.view?.setViewModels(builder.buildViewModels())
    }
    
    func attachView(_ view:EditClothesViewInput ) {
        self.view = view
        updateViewModels()
    }
    
    func viewModelAction(actionType:EditClothesVMActionsType) {
        switch actionType {
        case .editTitle:
            router?.openTextInputWith(placeholder: Constants.Placeholders.enterTitle, initialText: state.title, callback: { [unowned self](text) in
                self.state.title = text
                self.updateViewModels()
            })
        case .editNote:
            router?.openTextInputWith(placeholder: Constants.Placeholders.enterNote, initialText: state.note, callback: { [unowned self](text) in
                self.state.note = text
                self.updateViewModels()
            })
        case .editColor:
            router?.openColorPickerWith(intialColor: state.color, output: self)
        case .editIcons:
            router?.openIconsPickerWith(initialIcons: state.icons, output: self)
        case .editPhoto:
            router?.openPhotoPickerWith(initialPhotoPath: state.photoPath, output: self)
        case .editType:
            router?.openClothesTypePickerWith(initialType: state.type, output: self)
        }
    }
    
    func saveChanges() {
        
        if state.id == nil {
            state.id = UUID().uuidString
        }
        if state.title == nil {
            router?.showAlert(message: Constants.ErrorMessages.addTitleError)
            return
        }
        if state.type == nil {
            router?.showAlert(message: Constants.ErrorMessages.chooseTypeError)
            return
        }
        if state.color == nil {
            router?.showAlert(message: Constants.ErrorMessages.chooseColorError)
            return
        }
        if state.icons.count == 0 {
            router?.showAlert(message: Constants.ErrorMessages.chooseIconsError)
            return
        }
        
        clothesService.edit(clothes: Clothes(id: state.id!,
                                             title: state.title!,
                                             color: state.color!,
                                             photoPath: state.photoPath,
                                             note: state.note,
                                             isDirty: false,
                                             type: state.type!,
                                             laundryIcons: state.icons))
        
        router?.closeModule()
    }
    
}

extension EditClothesPresenter: ColorPickerOutput {
    func setColor(_ hexColor: String) {
        state.color = hexColor
        updateViewModels()
    }
}

extension EditClothesPresenter: IconsPickerOutput {
    func setIcons(_ icons: [LaundryIcon]) {
        state.icons = icons
        updateViewModels()
    }
}

extension EditClothesPresenter: ClothesTypePickerOutput {
    func setType(_ type: ClothesType) {
        state.type = type
        updateViewModels()
    }
}

extension EditClothesPresenter: PhotoPickerOutput {
    func setPhotoPath(_ path: String?) {
        state.photoPath = path
        updateViewModels()
    }
}
