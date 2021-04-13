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
    func initNavigation(_ navigationController: UINavigationController?)
    func navigate(_ viewController: UIViewController)
    func present(_ viewController: UIViewController)
}

protocol AppNavigator: Navigator {
    var auth: AuthNavigator { get }
}

class AppNavigation: BaseNavigator, AppNavigator {
    
    var auth: AuthNavigator {
        return AuthNavigation()
    }
    
}

protocol AuthNavigator: Navigator {
    func signIn()
    func createAccount()
    func profile()
    func editProfile()
    func dashboard()
}

class BaseNavigator: Navigator {
    
    var navigationController: UINavigationController?

    
    func initNavigation(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func navigate(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController,animated: true)
    }
    
    func present(_ viewController: UIViewController) {
        navigationController?.present(viewController, animated: true)
    }
    
}

class AuthNavigation: BaseNavigator, AuthNavigator {
    
    @Inject var dataManager: DataManager
    
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
    
    func dashboard() {
        if(dataManager.hasSession()){
            navigate(DashboardViewController())
        } else {
            navigate(WelcomeViewController())
        }
    }
}

