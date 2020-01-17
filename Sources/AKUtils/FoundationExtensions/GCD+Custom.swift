//
//  GCD+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 9/26/16.
//  Copyright © 2016 Artem Kalmykov. All rights reserved.
//

import Foundation

/// Dispatch after
public func dispatchAfter(seconds: Double, closure: @escaping EmptyClosure) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        closure()
    }
}

/// Dispatch after
public extension DispatchQueue {
    fileprivate static var onceTracker = [String]()

    class func once(token: String, closure: EmptyClosure) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        if self.onceTracker.contains(token) {
            return
        }
        
        self.onceTracker.append(token)
        closure()
    }
}
