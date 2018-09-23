//
//  AKTextField.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 7/3/17.
//  Copyright © 2017 Artem Kalmykov. All rights reserved.
//

import UIKit

public class AKTextField: UITextField {
    @IBOutlet open weak var nextField: UIResponder?
    
    @IBInspectable var handleReturn: Bool = false
    
    public var rightViewInset: UIEdgeInsets = .zero
    
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
        if self.returnKeyType == .next {
            self.nextField?.becomeFirstResponder()
        } else if self.returnKeyType == .done {
            self.resignFirstResponder()
        }
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.rightViewRect(forBounds: bounds).inset(by: rightViewInset)
    }
}
