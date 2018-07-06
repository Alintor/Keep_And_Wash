//
//  RealmMappable.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import RealmSwift

protocol RealmMappable {
    
    associatedtype RealmType: Object
    
    var realmObject: RealmType { get }
    static func mapFromRealmObject(_ object: RealmType) -> Self
    
}
