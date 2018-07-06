//
//  RealmStorageAssemblyContainer.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import Foundation
import Swinject

final class RealmStorageAssemblyContainer: Assembly {
    func assemble(container: Container) {
        container.register(RealmStorageType.self) { (_) in
            return RealmStorageNew()
        }
    }
}

