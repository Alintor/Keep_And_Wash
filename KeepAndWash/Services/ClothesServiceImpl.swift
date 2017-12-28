
class ClothesServiceImpl: ClothesService {
    let storage = RealmStorage<RealmClothes>()
    
    func getAllClothes() -> [Clothes] {
        return storage.getAll()
    }
    
    func getDirtyClothes() -> [Clothes] {
        return storage.getWith(key: "isDirty", value: true)
    }
    
    func getClothesBy(id: String) -> Clothes? {
        return storage.getBy(id: id)
    }
    
    func add(clothes: Clothes) {
        storage.insert(item: clothes)
    }
    
    func edit(clothes: Clothes) {
        storage.update(item: clothes)
    }
    
    func deleteClothesBy(id: String) {
        storage.deleteBy(id: id)
    }
    
}
