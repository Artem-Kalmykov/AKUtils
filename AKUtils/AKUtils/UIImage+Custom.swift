//
//  UIImage+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 2/18/17.
//  Copyright © 2017 Artem Kalmykov. All rights reserved.
//

import UIKit

extension UIImage {
    public static func create(withColor color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
