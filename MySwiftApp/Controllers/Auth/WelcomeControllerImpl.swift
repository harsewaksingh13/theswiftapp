//
//  WelcomeControllerPresenter.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation


class WelcomeControllerImpl: BaseController, WelcomeController {
    
    let welcomeView: WelcomeView
    let userNavigator: UserNavigator
    
    init(welcomeView view: WelcomeView,userNavigator: UserNavigator) {
        self.welcomeView = view
        self.userNavigator = userNavigator
        super.init(view: welcomeView)
    }
    
    func createAccount() {
        self.userNavigator.createAccount()
    }
    
    func signIn() {
        self.userNavigator.signIn()
    }
    
}
