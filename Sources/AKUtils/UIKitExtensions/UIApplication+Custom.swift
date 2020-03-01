//
//  UIApplication+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 01.03.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import UIKit

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    }
}
