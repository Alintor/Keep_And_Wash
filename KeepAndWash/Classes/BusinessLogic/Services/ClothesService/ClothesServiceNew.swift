//
//  ClothesServiceNew.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//


protocol ClothesServiceType {
    
    var allClothes: [ClothesItem] { get }
    func delete(_ item: ClothesItem)
    func update(_ item: ClothesItem)
}


final class ClothesServiceNew {
    
    private let storage: RealmStorageType!
    
    // MARK: - Init
    
    init(storage: RealmStorageType!) {
        self.storage = storage
    }
}

extension ClothesServiceNew: ClothesServiceType {
    
    var allClothes: [ClothesItem] {
        return storage.fethAll()
    }
    
    func delete(_ item: ClothesItem) {
        storage.delete(item)
    }
    
    func update(_ item: ClothesItem) {
        storage.insert(item)
    }
}
