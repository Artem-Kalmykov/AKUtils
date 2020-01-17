//
//  UIStoryboard+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

class CustomViewController: UIViewController {}

final class UIStoryboard_Custom_Tests: XCTestCase {
    func testViewControllerInstantiation() {
        let storyboard = UIStoryboard(name: "Testable", bundle: Bundle(for: UIStoryboard_Custom_Tests.self))
        _ = storyboard.instantiate(CustomViewController.self)
    }
}
