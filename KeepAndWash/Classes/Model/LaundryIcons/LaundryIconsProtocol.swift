//
//  LaundryIconsProtocol.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

protocol LaundryIconsProtocol {

    var stringValue: String { get }
    var category: LaundryIconsCategoryEnum { get }
    var priority: Int { get }
    
    static var allValues: [LaundryIconsProtocol] { get }
}

extension LaundryIconsProtocol {
    
    static var allValues: [LaundryIconsProtocol] {
        var values = [LaundryIconsProtocol]()
        values.append(contentsOf: WhiteningIcon.allValues)
        values.append(contentsOf: DryingIcon.allValues)
        values.append(contentsOf: IroningIcon.allValues)
        values.append(contentsOf: CleaningIcon.allValues)
        values.append(contentsOf: WhiteningIcon.allValues)
        return values
    }
}
