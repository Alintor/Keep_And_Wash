//
//  UILabel.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit

extension UILabel {
    
    @IBInspectable public var localizedTextKey: String {
        get {
            return ""
        }
        set {
            text = NSLocalizedString(newValue, tableName: R.string.localizable.tableName(), comment: "")
        }
    }
}
