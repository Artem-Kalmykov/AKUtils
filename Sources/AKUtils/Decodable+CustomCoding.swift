//
//  Decodable+CustomCoding.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 8/7/19.
//  Copyright © 2019 Artem Kalmykov. All rights reserved.
//

import Foundation

struct CustomCodingKeys: CodingKey {
    var stringValue: String
    init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    init?(intValue: Int) {
        return nil
    }
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
