//
//  UITableView+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 6/19/17.
//  Copyright © 2017 Artem Kalmykov. All rights reserved.
//

import UIKit

extension UITableView {
    public func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as! T
    }
    
    public func registerNib<T: UITableViewCell>(type: T.Type) {
        let nib = UINib(nibName: T.className, bundle: Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: T.reuseID)
    }
}
