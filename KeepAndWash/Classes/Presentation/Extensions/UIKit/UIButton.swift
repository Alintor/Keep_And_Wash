//
//  UIButton.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit

extension UIButton {
    
    @IBInspectable public var localizedTitleKey: String {
        get {
            return ""
        }
        set {
            setTitle(NSLocalizedString(newValue,
                                       tableName: R.string.localizable.tableName(),
                                       comment: ""), for: .normal)
        }
    }
}
