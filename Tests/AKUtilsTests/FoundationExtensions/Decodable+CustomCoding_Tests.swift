//
//  Decodable+CustomCoding_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import UIKit
import XCTest
@testable import AKUtils

final class Decodable_CustomCoding_Tests: XCTestCase {
    private struct CustomCodable: Codable {
        let customInt: Int?
        let customString: String?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CustomCodingKeys.self)
            self.customInt = try? container.decode(Int.self, forKey: CustomCodingKeys(stringValue: "customInt"))
            self.customString = try? container.decode(String.self, forKey: CustomCodingKeys(stringValue: "customString"))
        }
        
        init(int: Int?, string: String?) {
            customInt = int
            customString = string
        }
    }
    
    func testCustomCodingKeys() {
        let dict = [
            "customInt": 123,
            "customString": "321"
        ] as [String: Any]
        let data = try! JSONSerialization.data(withJSONObject: dict, options: [])
        
        let obj = try! JSONDecoder().decode(CustomCodable.self, from: data)
        
        XCTAssert(obj.customInt != nil)
        XCTAssert(obj.customInt == 123)
        
        XCTAssert(obj.customString != nil)
        XCTAssert(obj.customString == "321")
        
        let intKey = CustomCodingKeys(intValue: 123)!
        XCTAssert(intKey.intValue == 123)
        XCTAssert(intKey.stringValue == "123")
    }
    
    private struct NonCodable: Codable {
        init(from decoder: Decoder) throws {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [CustomCodingKeys(stringValue: "")], debugDescription: ""))
        }
        
        func encode(to encoder: Encoder) throws {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [CustomCodingKeys(stringValue: "")], debugDescription: ""))
        }
        
        init() {}
    }
    
    func testDictionaryConversion() {
        let obj = CustomCodable(int: 123, string: "321")
        let dict = obj.dictionary
        
        XCTAssert(dict != nil)
        XCTAssert((dict!["customInt"] as! Int) == 123)
        XCTAssert((dict!["customString"] as! String) == "321")
        
        XCTAssert(NonCodable().dictionary == nil)
    }
}
