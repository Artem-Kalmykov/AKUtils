//
//  UIAlertController+Custom.swift
//  FFControls
//
//  Created by Artem Kalmykov on 10/12/16.
//  Copyright © 2016 Faifly. All rights reserved.
//

import UIKit

extension UIAlertController {
    public static func showOKAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        alertController.addAction(OKAction)
        alertController.show()
    }
    
    private struct AssociatedKeys {
        static var AlertWindow = "alertWindow"
    }
    
    private var alertWindow: UIWindow? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.AlertWindow) as? UIWindow? ?? nil
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.AlertWindow, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func show() {
        let dummyController = DummyViewController()
        dummyController.statusBarStyle = UIApplication.shared.windows.last?.rootViewController?.preferredStatusBarStyle ?? .default
        
        self.alertWindow = UIWindow(frame: UIScreen.main.bounds)
        self.alertWindow?.rootViewController = dummyController
        
        let topWindow = UIApplication.shared.windows.last
        self.alertWindow?.windowLevel = topWindow!.windowLevel + 1
        
        self.alertWindow?.makeKeyAndVisible()
        self.alertWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.alertWindow?.isHidden = true
        self.alertWindow = nil
    }
}

private class DummyViewController: UIViewController {
    var statusBarStyle: UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}
