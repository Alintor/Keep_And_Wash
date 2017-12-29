
import RealmSwift

class RealmStorageUpdater {
    private let realm = try! Realm()
    
    private var needUpdate:Bool {
        if let storageVersion = UserDefaults.standard.string(forKey: Constants.Storage.storageVersionKey),
            storageVersion == Constants.Storage.storageVersion {
            return false
        } else {
            return true
        }
    }
    
    private func getResourceWith(name:String) -> [Any] {
        let path = Bundle.main.path(forResource: name, ofType: Constants.Storage.recourcesType)
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let json = try! JSONSerialization.jsonObject(with: jsonData, options: [])
        let array = json as! Array<Any>
        return array
    }
    
    private func updateClothesType() {
        let clothesTypeArray = getResourceWith(name: Constants.Storage.clothesTypeFileName)
        do {
            try realm.write {
                for item in clothesTypeArray {
                    realm.create(RealmClothesType.self, value: item, update: true)
                }
                
            }}
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func updateLaundryIconsCategory() {
        let iconsCat = getResourceWith(name: Constants.Storage.laundryIconsCategoryFileName)
        do {
            try realm.write {
                for item in iconsCat {
                    realm.create(RealmLaundryIconCategory.self, value: item, update: true)
                }
                
            }}
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func updateLaundryIcons() {
        let icons = getResourceWith(name: Constants.Storage.laundryIconsFileName)
        do {
            try realm.write {
                for item in icons {
                    let iconJson = item as! [String:Any]
                    let category = realm.object(ofType: RealmLaundryIconCategory.self, forPrimaryKey: iconJson["categoryId"] as! String).map { $0.plainObject }
                    let iconPlainPbject = LaundryIcon(id: iconJson["id"] as! String,
                                                      imageName: iconJson["imageName"] as! String,
                                                      desc: iconJson["desc"] as! String,
                                                      priority: iconJson["priority"] as! Int,
                                                      category: category!)
                    let iconRealm = RealmLaundryIcon(laundryIcon: iconPlainPbject)
                    realm.add(iconRealm, update: true)
                }
                
            }}
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    
    private func updateStorage() {
        updateClothesType()
        updateLaundryIconsCategory()
        updateLaundryIcons()
    }
    
    func validateStorage() {
        if needUpdate {
            updateStorage()
            UserDefaults.standard.set(Constants.Storage.storageVersion, forKey: Constants.Storage.storageVersionKey)
        }
        
    }
}
