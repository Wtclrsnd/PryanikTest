//
//  UIApplication+TopVC.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 02.06.2022.
//

import UIKit

extension UIApplication {

    /// Root key window of current connected scene
    var currentWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}

// MARK: - UIApplication + TopViewController

extension UIApplication {

    /// Returns the topmost viewController that is presented in the visible window
    /// - Parameter base: Hierarchy to search in
    func topViewController(
        base: UIViewController? = UIApplication.shared.currentWindow?.rootViewController
    ) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }
}
