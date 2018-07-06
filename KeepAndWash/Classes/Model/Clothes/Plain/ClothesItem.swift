//
//  ClothesItem.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

struct ClothesItem {
    let id: String
    var title: String
    var color: String
    var photoPath: String?
    var note: String?
    var isDirty: Bool
    var type: ClothesTypeEnum
    var laundryIcons: [LaundryIconsProtocol]
}
