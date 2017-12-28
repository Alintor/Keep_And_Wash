
import Foundation
import RealmSwift

class RealmLaundryIcon: Object, RealmObject {
    @objc dynamic var id = ""
    @objc dynamic var imageName = ""
    @objc dynamic var desc = ""
    @objc dynamic var priority = 0
    @objc dynamic var category: RealmLaundryIconCategory?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(laundryIcon: LaundryIcon) {
        self.init()
        fillWith(plainObject: laundryIcon)
    }
    
    func fillWith(plainObject laundryIcon: LaundryIcon) {
        id = laundryIcon.id
        imageName = laundryIcon.imageName
        desc = laundryIcon.desc
        priority = laundryIcon.priority
        category = RealmLaundryIconCategory(laundryIconCategory: laundryIcon.category)
    }
    
    var plainObject: LaundryIcon {
        return LaundryIcon(id: id,
                           imageName: imageName,
                           desc: desc,
                           priority: priority,
                           category: category!.plainObject)
    }
}
