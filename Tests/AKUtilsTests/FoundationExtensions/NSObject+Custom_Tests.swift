//
//  NSObject+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class NSObject_Custom_Tests: XCTestCase {
    func testClassName() {
        XCTAssert(NSObject_Custom_Tests.className == "NSObject_Custom_Tests")
        XCTAssert(self.className == "NSObject_Custom_Tests")
    }
}
