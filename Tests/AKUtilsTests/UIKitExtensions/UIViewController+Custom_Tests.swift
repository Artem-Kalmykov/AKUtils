//
//  UIViewController+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UIViewController_Custom_Tests: XCTestCase {
    private class CustomViewController1: UIViewController { }
    
    private class CustomViewController2: UIViewController {
        override class var storyboardID: String {
            return "Custom"
        }
    }
    
    func testStoryboardID() {
        XCTAssert(UIViewController.storyboardID == "UIViewController")
        XCTAssert(CustomViewController1.storyboardID == "CustomViewController1")
        XCTAssert(CustomViewController2.storyboardID == "Custom")
    }
    
    func testEmbeddingInNavigation() {
        let viewController = CustomViewController1()
        let navigationController = viewController.embedInNavigation()
        XCTAssert(navigationController.viewControllers.count == 1)
        XCTAssert(navigationController.viewControllers[0] === viewController)
    }
}
