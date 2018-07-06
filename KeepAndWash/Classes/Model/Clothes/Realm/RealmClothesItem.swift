//
//  RealmClothesItem.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import RealmSwift

class RealmClothesItem: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var color = ""
    @objc dynamic var photoPath: String?
    @objc dynamic var note: String?
    @objc dynamic var isDirty = false
    @objc dynamic var type = ""
    var laundryIcons = List<String>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
