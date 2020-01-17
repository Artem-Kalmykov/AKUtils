//
//  UIViewController+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 6/16/17.
//  Copyright © 2017 Artem Kalmykov. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc open class var storyboardID: String {
        return self.className
    }
    
    public func embedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
