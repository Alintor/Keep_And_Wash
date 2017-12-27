


import RealmSwift

class RealmStorage: DataSource {
    private let realm = try! Realm()
    
    func getAll() -> [Clothes] {
        return realm.objects(RealmClothes.self).map { $0.plainObject }
    }
    
    func getAll() -> [LaundryIcon] {
        return realm.objects(RealmLaundryIcon.self).map { $0.plainObject }
    }
    
    func getBy(id: String) -> Clothes? {
        return realm.object(ofType: RealmClothes.self, forPrimaryKey: id).map { $0.plainObject }
    }
    
    func getDirtyClothes() -> [Clothes] {
        return realm.objects(RealmClothes.self).filter("isDirty == %@", true).map { $0.plainObject }
    }
    
    func insert(item: Clothes) {
        try! realm.write {
            realm.add(RealmClothes(clothes: item))
        }
    }
    
    func update(item: Clothes) {
        try! realm.write {
            realm.add(RealmClothes(clothes: item), update: true)
        }
    }
    
    func deleteBy(id: String) {
        if let object = realm.object(ofType: RealmClothes.self, forPrimaryKey: id) {
            try! realm.write {
                realm.delete(object)
            }
        }
    }
    
}
