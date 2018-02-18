
import Foundation
import RealmSwift

class RealmClothesType: Object, RealmObject {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var imageName = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(clothesType: ClothesType) {
        self.init()
        fillWith(plainObject: clothesType)
    }
    
    func fillWith(plainObject clothesType: ClothesType) {
        id = clothesType.id
        title = clothesType.title
        imageName = clothesType.imageName
    }
    
    var plainObject: ClothesType {
        return ClothesType(id: id,
                           title: title,
                           imageName: imageName)
    }
}
