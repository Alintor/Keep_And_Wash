
protocol RealmObject {
    associatedtype T:PlainObject
    var plainObject:T {get}
    func fillWith(plainObject:T)
}
