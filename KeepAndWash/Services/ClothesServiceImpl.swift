
class ClothesServiceImpl: ClothesService {
    let clothesStorage = RealmStorage<RealmClothes>()
    let clothesTypeStorage = RealmStorage<RealmClothesType>()
    
    func getClothesTypes() -> [ClothesType] {
        return clothesTypeStorage.getAll()
    }
    
    func getAllClothes() -> [Clothes] {
        return clothesStorage.getAll()
    }
    
    func getDirtyClothes() -> [Clothes] {
        return clothesStorage.getWith(key: "isDirty", value: true)
    }
    
    func getClothesBy(id: String) -> Clothes? {
        return clothesStorage.getBy(id: id)
    }
    
    func add(clothes: Clothes) {
        clothesStorage.insert(item: clothes)
    }
    
    func edit(clothes: Clothes) {
        clothesStorage.update(item: clothes)
    }
    
    func deleteClothesBy(id: String) {
        clothesStorage.deleteBy(id: id)
    }
    
}
