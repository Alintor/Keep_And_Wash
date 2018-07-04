//
//  CleaningIcon.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

enum CleaningIcon: String, LaundryIconsProtocol {
    
    case allowed = "cleaning.allowed",
    not = "cleaning.not",
    typeA = "cleaning.typeA",
    typeP = "cleaning.typeP",
    typeF = "cleaning.typeF"
    
    var stringValue: String {
        return self.rawValue
    }
    
    var category: LaundryIconsCategoryEnum {
        return .cleaning
    }
    
    var priority: Int {
        return 1
    }
    
    static var allValues: [CleaningIcon] {
        return [.allowed, .not, .typeA, .typeP, .typeF]
    }
}
