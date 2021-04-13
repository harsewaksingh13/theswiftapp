//
//  WelcomeControllerPresenter.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation


class WelcomePresenterImpl: BasePresenter, WelcomePresenter {
    
    let welcomeView: WelcomeView
    @Inject var appNavigator: AppNavigator
    
    init(welcomeView view: WelcomeView) {
        self.welcomeView = view
        super.init(view: welcomeView)
        appNavigator.auth.initNavigation(view.viewController().navigationController)
    }
    
    func createAccount() {
        appNavigator.auth.createAccount()
    }
    
    func signIn() {
        appNavigator.auth.signIn()
    }
    
}
