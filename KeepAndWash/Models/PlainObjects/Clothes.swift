
struct Clothes {
    let id: String
    var title: String
    var imageName: String
    var color: String
    var photoPath: String?
    var note: String
    var isDirty: Bool
    var type: ClothesType
    let laundryIcons: [LaundryIcon]
}
