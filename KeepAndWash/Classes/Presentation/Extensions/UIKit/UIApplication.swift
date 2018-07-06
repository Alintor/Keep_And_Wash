//
//  UIApplication.swift
//  KeepAndWash
//
//  Created by Alexandr on 06/07/2018.
//  Copyright © 2018 Alexandr Ovchinnikov. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    static func setRootViewController(_ viewController: UIViewController?) {
        UIApplication.shared.delegate?.window??.rootViewController = viewController
    }
}
