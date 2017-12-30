
enum EditClothesViiewModelType {
    case photo
    case title
    case type
    case color
    case icons
    case note
    case button
}

class EditClothesViewModel {
    var type: EditClothesViiewModelType
    var data:Any?
    var callback:()->()
    
    init(type:EditClothesViiewModelType, data:Any?, callback:@escaping ()->()) {
        self.type = type
        self.data = data
        self.callback = callback
    }
    
}
