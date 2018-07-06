//
//  UITextField.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable public var localizedPlaceholderKey: String {
        get {
            return ""
        }
        set {
            placeholder = NSLocalizedString(newValue, tableName: R.string.localizable.tableName(), comment: "")
        }
    }
    
    @IBInspectable public var localizedTextKey: String {
        get {
            return ""
        }
        set {
            text = NSLocalizedString(newValue, tableName: R.string.localizable.tableName(), comment: "")
        }
    }
    
    @IBInspectable var aPlaceholderColor: UIColor? {
        get {
            return attributedPlaceholder?.attribute(
                NSAttributedStringKey.foregroundColor,
                at: 0,
                effectiveRange: nil
                )
                as? UIColor
        }
        set {
            guard
                let placeholder = placeholder,
                let placeholderColor = newValue else { return }
            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
        }
    }
}
