


import RealmSwift

class ClothesRealmStorage: DataSource {
    
    
    private let realm = try! Realm()
    
    func getAll() -> [Clothes] {
        return realm.objects(RealmClothes.self).map { $0.plainObject }
    }
    
    func getBy(id: String) -> Clothes? {
        return realm.object(ofType: RealmClothes.self, forPrimaryKey: id).map { $0.plainObject }
    }
    
    func getWith(parametrs: (key:String, value:Any)) -> [Clothes] {
        return realm.objects(RealmClothes.self).filter("\(parametrs.key) == %@", parametrs.value).map { $0.plainObject }
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
