//
//  ClothesItem+Realm.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import RealmSwift

extension ClothesItem: RealmMappable {

    typealias RealmType = RealmClothesItem

    var realmObject: RealmClothesItem {
        let object = RealmClothesItem()
        object.id = id
        object.title = title
        object.color = color
        object.photoPath = photoPath
        object.note = note
        object.isDirty = isDirty
        object.type = type.rawValue
        object.laundryIcons.append(objectsIn: laundryIcons.map({ $0.stringValue }))
        return object
    }
    static func mapFromRealmObject(_ object: RealmClothesItem) -> ClothesItem {
        
        return ClothesItem(
            id: object.id,
            title: object.title,
            color: object.color,
            photoPath: object.photoPath,
            note: object.note,
            isDirty: object.isDirty,
            type: ClothesTypeEnum(rawValue: object.type) ?? .other,
            laundryIcons: object.laundryIcons.compactMap({ (stringValue) -> LaundryIconsProtocol? in
                LaundryIconMapper.mapFromStringValue(stringValue)
            })
        )
    }
    
}
