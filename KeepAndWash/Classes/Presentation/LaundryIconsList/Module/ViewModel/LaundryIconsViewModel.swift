//
//  LaundryIconsViewModel.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit

struct LaundryIconsViewModel {
    
    let title: String
    let image: UIImage?
    
    init(with model: LaundryIconsProtocol) {
        title = NSLocalizedString(
            "model.LaundryIcons.\(model.stringValue)",
            tableName: R.string.localizable.tableName(),
            comment: "")
        image = UIImage(named: "laundryIcons.\(model.stringValue)")
    }
}
