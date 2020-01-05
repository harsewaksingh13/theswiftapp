//
//  Navigator.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 05/01/2020.
//  Copyright © 2020 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

protocol Navigator {
    func navigate(_ viewController: UIViewController)
    func present(_ viewController: UIViewController)
    func dashboard()
}


protocol UserNavigator : Navigator {
    func signIn()
    func createAccount()
    func profile()
    func editProfile()
}

class BaseNavigator : Navigator {
    
    var navigation: UINavigationController?
    
    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }
    
    func navigate(_ viewController: UIViewController) {
        navigation?.pushViewController(viewController,animated: true)
    }
    
    func present(_ viewController: UIViewController) {
        navigation?.present(viewController, animated: true)
    }
    
    func dashboard() {
        if(self.navigation?.appDelegate.dataManager.hasSession() ?? false){
            navigate(DashboardViewController())
        } else {
            navigate(WelcomeViewController())
        }
    }
}

class UserNavigatorImpl :BaseNavigator, UserNavigator {
    
    func signIn() {
       self.navigate(SignInViewController())
    }
    
    func createAccount() {
        self.navigate(CreateAccountViewController())
    }
    
    func profile() {
        
    }
    
    func editProfile() {
        
    }
}

