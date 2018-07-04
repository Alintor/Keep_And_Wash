//
//  LaundryIconsEnum.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

enum WashingIcon: String, LaundryIconsProtocol {
    
    case allowed = "washing.allowed",
    not = "washing.not",
    hand = "washing.hand",
    temp95 = "washing.temp95",
    temp60 = "washing.temp60",
    temp40 = "washing.temp40",
    temp30 = "washing.temp30",
    gentle = "washing.gentle",
    delicate = "washing.delicate"
    
    var stringValue: String {
        return self.rawValue
    }
    
    var category: LaundryIconsCategoryEnum {
        return .washing
    }
    
    var priority: Int {
        return 1
    }
    
    static var allValues: [WashingIcon] {
        return [.allowed, .not, .hand, .temp95, .temp60, .temp40, .temp30, .gentle, .delicate]
    }
}
