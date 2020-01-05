//
//  Extension+UIViewController.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 07/05/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import UIKit

extension UIViewController {
    var appDelegate:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
//    func applyTheme(theme:AppTheme)  {
//        view.backgroundColor = theme.background
//        self.navigationController?.navigationBar.barTintColor = theme.navigationBackground
//        //        self.navigationItem.
//    }

    var isPresentingController : Bool {
            let presentingIsModal = presentingViewController != nil
            let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
            let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

            return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    func back(animated: Bool) {
        if (isPresentingController) {
            dismiss(animated: animated)
        } else {
            self.navigationController?.popViewController(animated: animated)
        }
    }
}

extension UINavigationController {
    
     func enableSegue() {
        self.interactivePopGestureRecognizer?.isEnabled = true
    }
}
