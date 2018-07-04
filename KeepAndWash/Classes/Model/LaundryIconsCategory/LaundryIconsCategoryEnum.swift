//
//  LaundryIconsCategoryEnum.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

enum LaundryIconsCategoryEnum: String {
    
    case washing,
    drying,
    ironing,
    cleaning,
    whitening
    
    static var allValues: [LaundryIconsCategoryEnum] {
        return [.washing, .drying, .ironing, .cleaning, .whitening]
    }
}
