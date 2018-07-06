//
//  ApplicationAssembly.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {
    
    class var assembler: Assembler {
        return Assembler([
            // Storages
            RealmStorageAssemblyContainer(),
            
            // Services
            ClothesServiceAssemblyContainer()
            
            // Modules
            ])
    }
}

extension SwinjectStoryboard {
    
    @objc public class func setup() {
        // workaround to fix the issue https://github.com/Swinject/Swinject/issues/218
        Container.loggingFunction = nil
        
        guard let applicationContainer = ApplicationAssembly.assembler.resolver as? Container else { return }
        defaultContainer = applicationContainer
    }
}
