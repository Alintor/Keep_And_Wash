
enum EditClothesViiewModelType {
    case photo
    case title
    case type
    case color
    case icons
    case note
    case button
}

enum EditClothesVMActionsType {
    case editPhoto
    case editTitle
    case editType
    case editColor
    case editIcons
    case editNote
}

class EditClothesViewModel {
    var type: EditClothesViiewModelType
    var data:Any?
    var actionType: EditClothesVMActionsType
    
    init(type:EditClothesViiewModelType, actionType: EditClothesVMActionsType, data:Any?) {
        self.type = type
        self.data = data
        self.actionType = actionType
    }
    
}
