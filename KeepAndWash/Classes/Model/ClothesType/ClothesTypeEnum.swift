//
//  ClothesTypeEnum.swift
//  KeepAndWash
//
//  Created by Alexandr on 04/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//


enum ClothesTypeEnum: String {
    
    case shirt,
    tshirt,
    pants,
    underwear,
    shorts,
    bedclothes,
    socks,
    hoodie,
    other
    
    static var allValues: [ClothesTypeEnum] {
        return [.shirt, .tshirt, .pants, .underwear, .shorts, .bedclothes, .socks, .hoodie]
    }
}
