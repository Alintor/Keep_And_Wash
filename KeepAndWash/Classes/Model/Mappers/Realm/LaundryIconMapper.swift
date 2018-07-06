//
//  LaundryIconMapper.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

enum LaundryIconMapper {
    
    static func mapFromStringValue(_ stringValue: String) -> LaundryIconsProtocol? {
        return WashingIcon(rawValue: stringValue)
            ?? DryingIcon(rawValue: stringValue)
            ?? IroningIcon(rawValue: stringValue)
            ?? CleaningIcon(rawValue: stringValue)
            ?? WhiteningIcon(rawValue: stringValue)
    }
}
