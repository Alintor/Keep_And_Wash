
class EditClothesState {
    var id:String?
    var title:String?
    var color:String?
    var photoPath:String?
    var note:String?
    var type:ClothesType?
    var icons = [LaundryIcon]()
    
    init(clothes:Clothes?) {
        if let clothes = clothes {
            id = clothes.id
            title = clothes.title
            color = clothes.color
            photoPath = clothes.photoPath
            note = clothes.note
            type = clothes.type
            icons = clothes.laundryIcons
        }
    }
}
