
import Foundation

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
    
    func edit(clothes: Clothes) {
        clothesStorage.insert(item: clothes)
        NotificationCenter.default.post(name: Constants.Notifications.clothesChanged, object: nil)
    }
    
    func deleteClothesBy(id: String) {
        clothesStorage.deleteBy(id: id)
        NotificationCenter.default.post(name: Constants.Notifications.clothesChanged, object: nil)
    }
    
}
