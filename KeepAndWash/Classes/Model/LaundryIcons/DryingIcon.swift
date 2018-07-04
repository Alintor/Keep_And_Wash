//
//  DryingIcon.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//


enum DryingIcon: String, LaundryIconsProtocol {
    
    case allowed = "drying.allowed",
    not = "drying.not",
    washer = "drying.washer",
    notWasher = "drying.notWasher",
    notPress = "drying.notPress",
    lowTemp = "drying.lowTemp",
    middleTemp = "drying.middleTemp",
    highTemp = "drying.highTemp",
    gentle = "drying.gentle",
    delicate = "drying.delicate",
    rope = "drying.rope",
    vertical = "drying.vertical",
    horizontal = "drying.horizontal",
    shadow = "drying.shadow"
    
    var stringValue: String {
        return self.rawValue
    }
    
    var category: LaundryIconsCategoryEnum {
        return .drying
    }
    
    var priority: Int {
        return 1
    }
    
    static var allValues: [DryingIcon] {
        return [.allowed,
                .not,
                .washer,
                .notWasher,
                .notPress,
                .lowTemp,
                .middleTemp,
                .highTemp,
                .gentle,
                .delicate,
                .rope,
                .vertical,
                .horizontal,
                .shadow
        ]
    }
    
}
