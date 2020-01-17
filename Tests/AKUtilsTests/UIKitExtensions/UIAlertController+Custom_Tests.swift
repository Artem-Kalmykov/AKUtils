//
//  UIAlertController+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UIAlertController_Custom_Tests: XCTestCase {
    func testOKAlertPresentation() {
        let alert = UIAlertController.showOKAlert(title: "1", message: "2")
        XCTAssert(alert.actions.count == 1)
        XCTAssert(alert.actions[0].title == "OK")
        XCTAssert(alert.actions[0].style == .default)
        XCTAssert(alert.title == "1")
        XCTAssert(alert.message == "2")
        
        UIAlertController.dismissActiveAlert()
    }
}
