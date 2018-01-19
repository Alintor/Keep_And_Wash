
struct Clothes: PlainObject {
    let id: String
    var title: String
    var color: String
    var photoPath: String?
    var note: String?
    var isDirty: Bool
    var type: ClothesType
    var laundryIcons: [LaundryIcon]
}
