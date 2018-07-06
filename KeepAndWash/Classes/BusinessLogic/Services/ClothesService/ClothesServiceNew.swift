//
//  ClothesServiceNew.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//


protocol ClothesServiceType {
    
}


final class ClothesServiceNew {
    
    private let storage: RealmStorageType!
    
    // MARK: - Init
    
    init(storage: RealmStorageType!) {
        self.storage = storage
    }
}

extension ClothesServiceNew: ClothesServiceType {
    
}
