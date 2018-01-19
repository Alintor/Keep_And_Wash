
protocol ClothesService {
    func getClothesTypes() -> [ClothesType]
    func getAllClothes() -> [Clothes]
    func getDirtyClothes() -> [Clothes]
    func getClothesBy(id:String) -> Clothes?
    func edit(clothes:Clothes)
    func deleteClothesBy(id:String)
}
