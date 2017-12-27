
import Foundation
import RealmSwift

class LaundryIconCategoryRealm: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var imageName = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(laundryIconCategory: LaundryIconCategory) {
        self.init()
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
