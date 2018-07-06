//
//  ClothesServiceAssemblyContainer.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import Swinject

final class ClothesServiceAssemblyContainer: Assembly {
    func assemble(container: Container) {
        container.register(ClothesServiceType.self) { r in
            return ClothesServiceNew(storage: r.resolve(RealmStorageType.self))
        }
    }
}

