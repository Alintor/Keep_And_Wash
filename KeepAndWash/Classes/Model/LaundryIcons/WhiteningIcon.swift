//
//  WhiteningIcon.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

enum WhiteningIcon: String, LaundryIconsProtocol {
    
    case allowed = "whitening.allowed",
    not = "whitening.not",
    chlorine = "whitening.chlorine",
    notChlorine = "whitening.notChlorine"
    
    var stringValue: String {
        return self.rawValue
    }
    
    var category: LaundryIconsCategoryEnum {
        return .whitening
    }
    
    var priority: Int {
        return 1
    }
    
    static var allValues: [WhiteningIcon] {
        return [.allowed, .not, .chlorine, .notChlorine]
    }
}
