

import Foundation
import RealmSwift

class ClothesRealm: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var imageName = ""
    @objc dynamic var color = ""
    @objc dynamic var photoPath: String?
    @objc dynamic var note = ""
    @objc dynamic var isDirty = false
    @objc dynamic var type: ClothesTypeRealm?
    var laundryIcons = List<LaundryIconRealm>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(clothes: Clothes) {
        self.init()
        id = clothes.id
        title = clothes.title
        imageName = clothes.imageName
        color = clothes.color
        photoPath = clothes.photoPath
        note = clothes.note
        isDirty = clothes.isDirty
        type = ClothesTypeRealm(clothesType: clothes.type)
        //laundryIcons = List<LaundryIconRealm>(clothes.laundryIcons.map({ LaundryIconRealm(laundryIcon: $0)}))
        laundryIcons.append(objectsIn: clothes.laundryIcons.map({ LaundryIconRealm(laundryIcon: $0)}))
        
    }
    
    var plainObject: Clothes {
        return Clothes(id: id,
                       title: title,
                       imageName: imageName,
                       color: color,
                       photoPath: photoPath,
                       note: note,
                       isDirty: isDirty,
                       type: type!.plainObject,
                       laundryIcons: laundryIcons.map { $0.plainObject })
    }
}
