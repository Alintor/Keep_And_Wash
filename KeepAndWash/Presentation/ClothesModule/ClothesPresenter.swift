

import Foundation

protocol ClothesView: NSObjectProtocol {
    func setClothes(_ clothes:[Clothes])
    func setEmptyClothes()
}

class ClothesPresenter {
    
    private let clothesService: ClothesService
    private weak var view:ClothesView?
    
    init(service:ClothesService = ClothesServiceImpl(), view:ClothesView) {
        clothesService = service
        self.view = view
        updateClothes()
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
