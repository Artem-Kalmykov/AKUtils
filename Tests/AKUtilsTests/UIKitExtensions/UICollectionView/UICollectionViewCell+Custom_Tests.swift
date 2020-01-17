//
//  UICollectionViewCell+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UICollectionViewCell_Custom_Tests: XCTestCase {
    private class CustomCell1: UICollectionViewCell { }
    
    private class CustomCell2: UICollectionViewCell {
        override class var reuseID: String {
            return "Custom"
        }
    }
    
    func testReuseID() {
        XCTAssert(UICollectionViewCell.reuseID == "UICollectionViewCell")
        XCTAssert(CustomCell1.reuseID == "CustomCell1")
        XCTAssert(CustomCell2.reuseID == "Custom")
    }
}
