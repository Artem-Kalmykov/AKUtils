//
//  Utils.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 8/19/17.
//  Copyright © 2017 Artem Kalmykov. All rights reserved.
//

import Foundation

public typealias EmptyClosure = (() -> Void)

infix operator >? : ComparisonPrecedence
public func >? <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    case (.none, .none):
        return false
    case (.none, _?):
        return false
    case (_?, .none):
        return true
    }
}

infix operator >=? : ComparisonPrecedence
public func >=? <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l >= r
    case (.none, .none):
        return false
    case (.none, _?):
        return false
    case (_?, .none):
        return true
    }
}

infix operator <? : ComparisonPrecedence
public func <? <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (.none, .none):
        return false
    case (.none, _?):
        return true
    case (_?, .none):
        return false
    }
}

infix operator <=? : ComparisonPrecedence
public func <=? <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l <= r
    case (.none, .none):
        return false
    case (.none, _?):
        return true
    case (_?, .none):
        return false
    }
}
