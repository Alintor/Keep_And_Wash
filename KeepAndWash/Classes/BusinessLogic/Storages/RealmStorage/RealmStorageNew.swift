//
//  RealmStorageNew.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import RealmSwift


protocol RealmStorageType {
    
    func fethAll<PlainType: RealmMappable>() -> [PlainType]
    func fetch<PlainType: RealmMappable>(by id: String) -> PlainType?
    func fetch<PlainType: RealmMappable>(withKey key: String, value:Any) -> [PlainType]
    func insert<PlainType: RealmMappable>(_ item: PlainType)
    func delete<PlainType: RealmMappable>(_ item: PlainType)
}

final class RealmStorageNew: RealmStorageType {
    
    private let realm = try! Realm()
    
    func fethAll<PlainType: RealmMappable>() -> [PlainType] {
        return realm.objects(PlainType.RealmType.self).map { PlainType.mapFromRealmObject($0) }
    }
    
    func fetch<PlainType: RealmMappable>(by id: String) -> PlainType? {
        return realm.object(
            ofType: PlainType.RealmType.self,
            forPrimaryKey: id).map { PlainType.mapFromRealmObject($0) }
    }
    
    func fetch<PlainType: RealmMappable>(withKey key: String, value:Any) -> [PlainType] {
        return realm.objects(PlainType.RealmType.self).filter("\(key) == %@", value).map { PlainType.mapFromRealmObject($0) }
    }
    
    func insert<PlainType: RealmMappable>(_ item: PlainType) {
        try? realm.write {
            realm.add(item.realmObject, update: true)
        }
    }
    
    func delete<PlainType: RealmMappable>(_ item: PlainType) {
        try? realm.write {
            realm.delete(item.realmObject)
        }
    }
}
