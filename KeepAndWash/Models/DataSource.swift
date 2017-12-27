
protocol DataSource {
    associatedtype T
    func getAll() -> [T]
    func getBy(id:String) -> T?
    func getWith(parametrs: (key:String, value:Any)) -> [T]
    func insert(item:T)
    func update(item:T)
    func deleteBy(id:String)
}
