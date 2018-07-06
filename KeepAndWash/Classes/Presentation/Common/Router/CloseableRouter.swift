//
//  CloseableRouter.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import LightRoute

protocol CloseableRouter: Router {
    
    func close(animated: Bool)
}

extension CloseableRouter {
    
    func close(animated: Bool) {
        try? transitionHandler.closeCurrentModule().perform()
    }
}
