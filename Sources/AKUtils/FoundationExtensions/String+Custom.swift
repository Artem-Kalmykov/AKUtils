//
//  String+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 9/26/16.
//  Copyright © 2016 Artem Kalmykov. All rights reserved.
//

import Foundation

extension String {
    /// Search
    public func corresponds(toSearchString searchString: String) -> Bool {
        return self.range(of: searchString, options: [.caseInsensitive, .diacriticInsensitive]) != nil
    }
    
    /// Empty
    public static func isEmpty(_ string: String?) -> Bool {
        if string == nil {
            return true
        } else if string!.count == 0 {
            return true
        }
        return false
    }
    
    public var isEmpty: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).count == 0
    }
    
    public var isValidEmail: Bool {
        let emailRegEx = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    public var removingHTMLTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    /// Returns localized version of the string
    public var localized: String {
        return LocalizedString(self)
    }
}

/// Localization
public func LocalizedString(_ string: String) -> String {
    let localized = NSLocalizedString(string, comment: "")
    if localized == string.uppercased() {
        return string
    }
    return localized
}
