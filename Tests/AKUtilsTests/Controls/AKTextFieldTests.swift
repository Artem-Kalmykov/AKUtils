//
//  AKTextFieldTests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class AKTextFieldTests: XCTestCase {
    private var viewController: UIViewController!
    private var textField: AKTextField!
    
    override func setUp() {
        super.setUp()
        
        viewController = UIViewController()
        let window = UIWindow()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        textField = AKTextField()
        viewController.loadViewIfNeeded()
        viewController.view.addSubview(textField)
    }
    
    func testInitialization() {
        verifyEditingDidEndTarget(AKTextField())
        verifyEditingDidEndTarget(AKTextField(frame: .zero))
        
        let archiver = NSKeyedUnarchiver(forReadingWith: Data())
        verifyEditingDidEndTarget(AKTextField(coder: archiver)!)
    }
    
    private func verifyEditingDidEndTarget(_ textField: AKTextField) {
        let actions = textField.actions(forTarget: textField, forControlEvent: .editingDidEndOnExit)!
        XCTAssert(actions.count == 1)
        XCTAssert(actions.first == "onReturnButton")
    }
    
    func testReturnButtonHandling() {
        let textField2 = AKTextField()
        viewController.view.addSubview(textField2)
        
        XCTAssert(!textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
        XCTAssert(textField.nextField == nil)
        
        textField.sendActions(for: .editingDidEndOnExit)
        XCTAssert(!textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
        
        textField.returnKeyType = .next
        textField.sendActions(for: .editingDidEndOnExit)
        XCTAssert(!textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
        
        textField.nextField = textField2
        textField.sendActions(for: .editingDidEndOnExit)
        XCTAssert(!textField.isFirstResponder)
        XCTAssert(textField2.isFirstResponder)
        
        textField2.returnKeyType = .done
        textField2.sendActions(for: .editingDidEndOnExit)
        XCTAssert(!textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
        
        textField.nextField = nil
        textField.sendActions(for: .editingDidEndOnExit)
        XCTAssert(!textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
        
        textField.returnKeyType = .emergencyCall
        textField.sendActions(for: .editingDidEndOnExit)
        XCTAssert(!textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
        
        textField.becomeFirstResponder()
        textField.handleReturn = false
        textField.returnKeyType = .next
        textField.nextField = textField2
        textField.sendActions(for: .editingDidEndOnExit)
        XCTAssert(textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
        
        textField.returnKeyType = .done
        textField.sendActions(for: .editingDidEndOnExit)
        XCTAssert(textField.isFirstResponder)
        XCTAssert(!textField2.isFirstResponder)
    }
    
    func testTextInsets() {
        let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        
        var textRect = textField.textRect(forBounds: rect)
        XCTAssert(abs(textRect.origin.x - 0.0) <= .ulpOfOne)
        XCTAssert(abs(textRect.origin.y - 0.0) <= .ulpOfOne)
        XCTAssert(abs(textRect.size.width - 100.0) <= .ulpOfOne)
        XCTAssert(abs(textRect.size.height - 100.0) <= .ulpOfOne)
        
        textField.textInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
        textRect = textField.textRect(forBounds: rect)
        XCTAssert(abs(textRect.origin.x - 10.0) <= .ulpOfOne)
        XCTAssert(abs(textRect.origin.y - 20.0) <= .ulpOfOne)
        XCTAssert(abs(textRect.size.width - 80.0) <= .ulpOfOne)
        XCTAssert(abs(textRect.size.height - 60.0) <= .ulpOfOne)
        
        let editingRect = textField.editingRect(forBounds: rect)
        XCTAssert(abs(textRect.origin.x - editingRect.origin.x) <= .ulpOfOne)
        XCTAssert(abs(textRect.origin.y - editingRect.origin.y) <= .ulpOfOne)
        XCTAssert(abs(textRect.size.width - editingRect.size.width) <= .ulpOfOne)
        XCTAssert(abs(textRect.size.height - editingRect.size.height) <= .ulpOfOne)
    }
    
    func testRightViewInsets() {
        let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        
        var rightViewRect = textField.rightViewRect(forBounds: rect)
        XCTAssert(abs(rightViewRect.origin.x - 100.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.origin.y - 50.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.size.width - 0.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.size.height - 0.0) <= .ulpOfOne)
        
        textField.textInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
        rightViewRect = textField.rightViewRect(forBounds: rect)
        XCTAssert(abs(rightViewRect.origin.x - 100.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.origin.y - 50.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.size.width - 0.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.size.height - 0.0) <= .ulpOfOne)
        
        textField.rightViewInset = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        rightViewRect = textField.rightViewRect(forBounds: rect)
        XCTAssert(abs(rightViewRect.origin.x - 110.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.origin.y - 55.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.size.width - -20.0) <= .ulpOfOne)
        XCTAssert(abs(rightViewRect.size.height - -10.0) <= .ulpOfOne)
    }
    
    func testActions() {
        UIPasteboard.general.string = "123"
        textField.text = "123"
        textField.becomeFirstResponder()
        
        XCTAssert(textField.canPerformAction(#selector(UIResponderStandardEditActions.paste(_:)), withSender: nil))
        textField.isPasteEnabled = false
        XCTAssert(!textField.canPerformAction(#selector(UIResponderStandardEditActions.paste(_:)), withSender: nil))
        
        XCTAssert(textField.canPerformAction(#selector(UIResponderStandardEditActions.select(_:)), withSender: nil))
        textField.isSelectEnabled = false
        XCTAssert(!textField.canPerformAction(#selector(UIResponderStandardEditActions.select(_:)), withSender: nil))
        
        XCTAssert(textField.canPerformAction(#selector(UIResponderStandardEditActions.selectAll(_:)), withSender: nil))
        textField.isSelectAllEnabled = false
        XCTAssert(!textField.canPerformAction(#selector(UIResponderStandardEditActions.selectAll(_:)), withSender: nil))
        
        textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
        XCTAssert(textField.canPerformAction(#selector(UIResponderStandardEditActions.copy(_:)), withSender: nil))
        textField.isCopyEnabled = false
        XCTAssert(!textField.canPerformAction(#selector(UIResponderStandardEditActions.copy(_:)), withSender: nil))
        
        XCTAssert(textField.canPerformAction(#selector(UIResponderStandardEditActions.cut(_:)), withSender: nil))
        textField.isCutEnabled = false
        XCTAssert(!textField.canPerformAction(#selector(UIResponderStandardEditActions.cut(_:)), withSender: nil))
        
        textField.isDeleteEnabled = false
        XCTAssert(!textField.canPerformAction(#selector(UIResponderStandardEditActions.delete(_:)), withSender: nil))
    }
}
