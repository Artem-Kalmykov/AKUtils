//
//  GCD+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class GCD_Custom_Tests: XCTestCase {
    func testDispatchAfter() {
        let expectation = self.expectation(description: "dispatch_after")
        dispatchAfter(seconds: 0.1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.11)
    }
    
    func testDispatchOnce() {
        var a = 0
        DispatchQueue.once(token: "123") {
            a += 1
        }
        DispatchQueue.once(token: "123") {
            a += 1
        }
        XCTAssert(a == 1)
    }
}
