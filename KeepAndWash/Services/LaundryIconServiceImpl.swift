
class LaundryIconServiceImpl: LaundryIconService {
    let iconsStorage = RealmStorage<RealmLaundryIcon>()
    let categoryStorage = RealmStorage<RealmLaundryIconCategory>()
    

    
    func getIconsFor(category:LaundryIconCategory) -> [LaundryIcon] {
        let key = "category.id"
        return iconsStorage.getWith(key: key, value: category.id)
    }
    
    func getIconsCategories() -> [LaundryIconCategory] {
        return categoryStorage.getAll()
    }
    
    func getAllIcons() -> [LaundryIcon] {
        return iconsStorage.getAll()
    }
    
    
}
