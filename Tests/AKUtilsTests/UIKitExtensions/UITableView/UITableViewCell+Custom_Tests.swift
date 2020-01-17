//
//  UITableViewCell+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UITableViewCell_Custom_Tests: XCTestCase {
    private class CustomCell1: UITableViewCell { }
    
    private class CustomCell2: UITableViewCell {
        override class var reuseID: String {
            return "Custom"
        }
    }
    
    func testReuseID() {
        XCTAssert(UITableViewCell.reuseID == "UITableViewCell")
        XCTAssert(CustomCell1.reuseID == "CustomCell1")
        XCTAssert(CustomCell2.reuseID == "Custom")
    }
}
