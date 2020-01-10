//
//  UITableViewCell+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 10/4/16.
//  Copyright © 2016 Artem Kalmykov. All rights reserved.
//

import UIKit

extension UITableViewCell {
    open class var reuseID: String {
        return self.className
    }
}
