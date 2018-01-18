
protocol ClothesViewInput: class {
    func setClothes(_ clothes:[Clothes])
    func setEmptyClothes()
}

protocol ClothesViewOutput {
    func attachView(_ view:ClothesViewInput)
    func showIcons()
    func addNewClothes()
    func editClothes(_ clothes:Clothes)
    func deleteClothes(_ clothes:Clothes)
    func markClothes(_ clothes:Clothes)
}

class ClothesPresenter: ClothesViewOutput {
    
    private let clothesService: ClothesService
    private weak var view:ClothesViewInput?
    var router: ClothesRouter?
    
    init(service:ClothesService) {
        clothesService = service
    }
    
    func attachView(_ view:ClothesViewInput) {
        self.view = view
        updateClothes()
    }
    
    func showIcons() {
        router?.openLaundryIconsModule()
    }
    
    func addNewClothes() {
        router?.openEditClothesModuleWith(clothes: nil)
    }
    
    func editClothes(_ clothes:Clothes) {
        router?.openEditClothesModuleWith(clothes: clothes)
    }
    
    func deleteClothes(_ clothes:Clothes) {
        
    }
    
    func markClothes(_ clothes:Clothes) {
        
    }
    
    private func updateClothes() {
        let clothes = clothesService.getAllClothes()
        if clothes.count == 0 {
            view?.setEmptyClothes()
        } else {
            view?.setClothes(clothes)
        }
        
    }
}
