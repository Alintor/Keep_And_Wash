//
//  ClothesListViewModel.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit



struct ClothesListViewModel {
    
    typealias ActionClosure = (_ action: ActionType, _ model: ClothesListViewModel) -> Void
    
    enum ActionType {
        case edit
        case delete
        case mark
    }
    
    let title: String
    let image: UIImage?
    let color: UIColor
    let isDirty: Bool
    let actionClosure: ActionClosure?
    
    let model: ClothesItem
    
    init(withModel model: ClothesItem, actionClosure: ActionClosure?) {
        self.model = model
        title = model.title
        image = UIImage(named: "clothesType.\(model.type.rawValue)")
        color = UIColor(hex: model.color)
        isDirty = model.isDirty
        self.actionClosure = actionClosure
    }
}
