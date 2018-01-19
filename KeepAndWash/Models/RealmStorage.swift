import RealmSwift

class RealmStorage<U:RealmObject> where U:Object {
    
    typealias T = U.T
    private let realm = try! Realm()
    
    func getAll() -> [T] {
        return realm.objects(U.self).map { $0.plainObject }
    }
    
    func getBy(id: String) -> T? {
        return realm.object(ofType: U.self, forPrimaryKey: id).map { $0.plainObject }
    }
    
    func getWith(key:String, value:Any) -> [T] {
        return realm.objects(U.self).filter("\(key) == %@", value).map { $0.plainObject }
    }
    
    func insert(item: T) {
        try! realm.write {
            let obj = U()
            obj.fillWith(plainObject: item)
            realm.add(obj, update: true)
        }
    }
    
    func deleteBy(id: String) {
        if let object = realm.object(ofType: U.self, forPrimaryKey: id) {
            try! realm.write {
                realm.delete(object)
            }
        }
    }
    
}

