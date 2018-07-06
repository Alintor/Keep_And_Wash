//
//  UISearchBar.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    @IBInspectable public var localizedPlaceholderKey: String {
        get {
            return ""
        }
        set {
            placeholder = NSLocalizedString(newValue, tableName: R.string.localizable.tableName(), comment: "")
        }
    }
}
