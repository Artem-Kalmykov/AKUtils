//
//  UICollectionViewCell+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 10/6/16.
//  Copyright © 2016 Artem Kalmykov. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    open class var reuseID: String {
        return self.className
    }
}
