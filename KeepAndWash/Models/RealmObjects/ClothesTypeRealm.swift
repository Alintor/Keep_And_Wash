
import Foundation
import RealmSwift

class ClothesTypeRealm: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var imageName = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(clothesType: ClothesType) {
        self.init()
        id = clothesType.id
        title = clothesType.title
        imageName = clothesType.title
    }
    
    var plainObject: ClothesType {
        return ClothesType(id: id,
                           title: title,
                           imageName: imageName)
    }
}
