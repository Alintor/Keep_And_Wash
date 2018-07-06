//
//  UIBarButtonItem.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    @IBInspectable var localizedKey: String {
        get {
            return ""
        }
        set {
            title = NSLocalizedString(newValue, tableName: R.string.localizable.tableName(), comment: "")
        }
    }
}
