//
//  AKTextField.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 7/3/17.
//  Copyright © 2017 Artem Kalmykov. All rights reserved.
//

import UIKit

open class AKTextField: UITextField {
    @IBOutlet open weak var nextField: UIResponder?
    
    @IBInspectable public var handleReturn: Bool = true
    @IBInspectable public var isPasteEnabled: Bool = true
    @IBInspectable public var isSelectEnabled: Bool = true
    @IBInspectable public var isSelectAllEnabled: Bool = true
    @IBInspectable public var isCopyEnabled: Bool = true
    @IBInspectable public var isCutEnabled: Bool = true
    @IBInspectable public var isDeleteEnabled: Bool = true
    @IBInspectable public var rightViewInset: UIEdgeInsets = .zero
    @IBInspectable public var textInset: UIEdgeInsets = .zero
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    private func setUp() {
        self.addTarget(self, action: #selector(onReturnButton), for: .editingDidEndOnExit)
    }
    
    @objc private func onReturnButton() {
        guard handleReturn else { return }
        
        if self.returnKeyType == .next {
            self.nextField?.becomeFirstResponder()
        } else if self.returnKeyType == .done {
            self.resignFirstResponder()
        }
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.rightViewRect(forBounds: bounds).inset(by: rightViewInset)
    }
    
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        switch action {
        case #selector(UIResponderStandardEditActions.paste(_:)) where !isPasteEnabled,
             #selector(UIResponderStandardEditActions.select(_:)) where !isSelectEnabled,
             #selector(UIResponderStandardEditActions.selectAll(_:)) where !isSelectAllEnabled,
             #selector(UIResponderStandardEditActions.copy(_:)) where !isCopyEnabled,
             #selector(UIResponderStandardEditActions.cut(_:)) where !isCutEnabled,
             #selector(UIResponderStandardEditActions.delete(_:)) where !isDeleteEnabled:
            return false
        default:
            return super.canPerformAction(action, withSender: sender)
        }
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInset)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
}
