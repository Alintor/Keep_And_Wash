
protocol ClothesService {
    func getAllClothes() -> [Clothes]
    func getDirtyClothes() -> [Clothes]
    func getClothesBy(id:String) -> Clothes?
    func add(clothes:Clothes)
    func edit(clothes:Clothes)
    func deleteClothesBy(id:String)
}
