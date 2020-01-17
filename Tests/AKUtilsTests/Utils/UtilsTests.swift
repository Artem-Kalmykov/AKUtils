//
//  UtilsTests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UtilsTests: XCTestCase {
    func testComparisonOperators() {
        let nilInt: Int? = nil
        
        XCTAssertFalse(nilInt <? nilInt)
        XCTAssertTrue(1 <? 2)
        XCTAssertTrue(nil <? 1)
        XCTAssertFalse(1 <? nil)
        
        XCTAssertFalse(nilInt <=? nilInt)
        XCTAssertTrue(1 <=? 2)
        XCTAssertTrue(nil <=? 1)
        XCTAssertFalse(1 <=? nil)
        
        XCTAssertFalse(nilInt >? nilInt)
        XCTAssertTrue(2 >? 1)
        XCTAssertFalse(nil >? 1)
        XCTAssertTrue(1 >? nil)
        
        XCTAssertFalse(nilInt >=? nilInt)
        XCTAssertTrue(2 >=? 1)
        XCTAssertFalse(nil >=? 1)
        XCTAssertTrue(1 >=? nil)
    }
}
