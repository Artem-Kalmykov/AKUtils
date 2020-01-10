//
//  Decodable+CustomCoding.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 8/7/19.
//  Copyright © 2019 Artem Kalmykov. All rights reserved.
//

import Foundation

public struct CustomCodingKeys: CodingKey {
    public var stringValue: String
    public init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public var intValue: Int?
    public init?(intValue: Int) {
        return nil
    }
}

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
