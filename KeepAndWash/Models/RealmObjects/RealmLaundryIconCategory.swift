
import Foundation
import RealmSwift

class RealmLaundryIconCategory: Object, RealmObject {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var imageName = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(laundryIconCategory: LaundryIconCategory) {
        self.init()
        fillWith(plainObject: laundryIconCategory)
    }
    
    func fillWith(plainObject laundryIconCategory: LaundryIconCategory) {
        id = laundryIconCategory.id
        title = laundryIconCategory.title
        imageName = laundryIconCategory.imageName
    }
    
    var plainObject: LaundryIconCategory {
        return LaundryIconCategory(id: id,
                                   title: title,
                                   imageName: imageName)
    }
}
