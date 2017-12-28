
class LaundryIconServiceImpl: LaundryIconService {
    let storage = RealmStorage<RealmLaundryIcon>()
    

    
    func getAllIcons() -> [LaundryIcon] {
        
        return storage.getAll()
    }
    
    
}
