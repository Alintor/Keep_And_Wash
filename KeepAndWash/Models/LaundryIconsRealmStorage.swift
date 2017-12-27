import RealmSwift

class LaundryIconsRealmStorage: DataSource {
    private let realm = try! Realm()
    
    func getAll() -> [LaundryIcon] {
        return realm.objects(RealmLaundryIcon.self).map { $0.plainObject }
    }
    
    func getBy(id: String) -> LaundryIcon? {
        return realm.object(ofType: RealmLaundryIcon.self, forPrimaryKey: id).map { $0.plainObject }
    }
    
    func getWith(parametrs: (key:String, value:Any)) -> [LaundryIcon] {
        return realm.objects(RealmLaundryIcon.self).filter("\(parametrs.key) == %@", parametrs.value).map { $0.plainObject }
    }
    
    func insert(item: LaundryIcon) {
        try! realm.write {
            realm.add(RealmLaundryIcon(laundryIcon: item))
        }
    }
    
    func update(item: LaundryIcon) {
        try! realm.write {
            realm.add(RealmLaundryIcon(laundryIcon: item), update: true)
        }
    }
    
    func deleteBy(id: String) {
        if let object = realm.object(ofType: RealmLaundryIcon.self, forPrimaryKey: id) {
            try! realm.write {
                realm.delete(object)
            }
        }
    }
}
