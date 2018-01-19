
class EditClothesVMBuilder {
    private let state:EditClothesState
    
    init(state:EditClothesState) {
        self.state = state
    }
    
    func buildViewModels() -> [EditClothesViewModel] {
        var viewModels = [EditClothesViewModel]()
        
        if let title = state.title {
            viewModels.append(EditClothesViewModel(type: .title, actionType: .editTitle, data: title))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editTitle, data: Constants.ButtonTitles.addTitle))
        }
        
        if let type = state.type {
            viewModels.append(EditClothesViewModel(type: .type, actionType: .editType, data: type))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editType, data: Constants.ButtonTitles.chooseType))
        }
        
        if let color = state.color {
            viewModels.append(EditClothesViewModel(type: .color, actionType: .editColor, data: color))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editColor, data: Constants.ButtonTitles.chooseColor))
        }
        
        if state.icons.count != 0 {
            viewModels.append(EditClothesViewModel(type: .icons, actionType: .editIcons, data: state.icons))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editIcons, data: Constants.ButtonTitles.chooseIcons))
        }
        
        if let path = state.photoPath {
            viewModels.append(EditClothesViewModel(type: .photo, actionType: .editPhoto, data: path))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editPhoto, data: Constants.ButtonTitles.addPhoto))
        }
        
        if let note = state.note {
            viewModels.append(EditClothesViewModel(type: .note, actionType: .editNote, data: note))
        } else {
            viewModels.append(EditClothesViewModel(type: .button, actionType: .editNote, data: Constants.ButtonTitles.addNote))
        }
        
        return viewModels
    }
}
