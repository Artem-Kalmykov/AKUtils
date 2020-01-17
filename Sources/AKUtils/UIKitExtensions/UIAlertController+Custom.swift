//
//  UIAlertController+Custom.swift
//  AKUtils
//
//  Created by Artem Kalmykov on 10/12/16.
//  Copyright © 2016 Faifly. All rights reserved.
//

import UIKit

extension UIAlertController {
    @discardableResult public static func showOKAlert(title: String?, message: String?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        alertController.addAction(okAction)
        alertController.show()
        return alertController
    }
    
    private struct AssociatedKeys {
        static var alertWindow = "alertWindow"
    }
    
    private var alertWindow: UIWindow? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.alertWindow) as? UIWindow
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.alertWindow, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func show() {
        let dummyController = DummyAlertViewController()
        dummyController.statusBarStyle = UIApplication.shared.keyWindow?.rootViewController?.preferredStatusBarStyle ?? .default
        
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
        if #available(iOS 13.0, *) {
            self.alertWindow?.windowScene = nil
        }
        self.alertWindow = nil
    }
    
    public static func dismissActiveAlert() {
        if let dummyController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController as? DummyAlertViewController {
            dummyController.presentedViewController?.dismiss(animated: true)
        }
    }
}

private class DummyAlertViewController: UIViewController {
    var statusBarStyle: UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}
