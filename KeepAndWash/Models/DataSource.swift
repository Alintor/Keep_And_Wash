
protocol DataSource {
    func getAll() -> [Clothes]
    func getAll() -> [LaundryIcon]
    func getBy(id:String) -> Clothes?
    func getDirtyClothes() -> [Clothes]
    func insert(item:Clothes)
    func update(item:Clothes)
    func deleteBy(id:String)
}
