//
//  NSObject+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 6/16/17.
//  Copyright © 2017 Artem Kalmykov. All rights reserved.
//

import Foundation

extension NSObject {
    public class var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}
