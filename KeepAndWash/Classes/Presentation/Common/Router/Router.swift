//
//  Router.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import LightRoute

protocol Router {
    
    var transitionHandler: TransitionHandler! { get set }
}
