

import Foundation
import RealmSwift

class RealmClothes: Object, RealmObject {
    
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var color = ""
    @objc dynamic var photoPath: String?
    @objc dynamic var note: String?
    @objc dynamic var isDirty = false
    @objc dynamic var type: RealmClothesType?
    var laundryIcons = List<RealmLaundryIcon>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(clothes: Clothes) {
        self.init()
        fillWith(plainObject: clothes)
    }
    
    func fillWith(plainObject clothes: Clothes) {
        id = clothes.id
        title = clothes.title
        color = clothes.color
        photoPath = clothes.photoPath
        note = clothes.note
        isDirty = clothes.isDirty
        type = RealmClothesType(clothesType: clothes.type)
        //laundryIcons = List<LaundryIconRealm>(clothes.laundryIcons.map({ LaundryIconRealm(laundryIcon: $0)}))
        laundryIcons.append(objectsIn: clothes.laundryIcons.map({ RealmLaundryIcon(laundryIcon: $0)}))
        
    }
    
    var plainObject: Clothes {
        return Clothes(id: id,
                       title: title,
                       color: color,
                       photoPath: photoPath,
                       note: note,
                       isDirty: isDirty,
                       type: type!.plainObject,
                       laundryIcons: laundryIcons.map { $0.plainObject })
    }
}
