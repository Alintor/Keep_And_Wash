//
//  IroningIcon.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

enum IroningIcon: String, LaundryIconsProtocol {
    
    case allowed = "ironing.allowed",
    not = "ironing.not",
    highTemp = "ironing.highTemp",
    middleTemp = "ironing.middleTemp",
    lowTemp = "ironing.lowTemp",
    notSteam = "ironing.notSteam"
    
    var stringValue: String {
        return self.rawValue
    }
    
    var category: LaundryIconsCategoryEnum {
        return .ironing
    }
    
    var priority: Int {
        return 1
    }
    
    static var allValues: [IroningIcon] {
        return [.allowed, .not, .highTemp, .middleTemp, .lowTemp, .notSteam]
    }
}
