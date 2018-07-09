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
}
