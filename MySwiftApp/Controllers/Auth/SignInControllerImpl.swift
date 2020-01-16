//
//  LoginControllerImpl.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 11/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation

class SignInControllerImpl :BaseController, SignInController {
    
    
    let loginView : SignInView
    let userInteractor: UserInteractor
    let userNavigator: UserNavigator
    
    init(view: SignInView, userInteractor: UserInteractor,userNavigator: UserNavigator) {
        self.loginView = view
        self.userInteractor = userInteractor
        self.userNavigator = userNavigator
        super.init(view: view)
    }
    
    func signIn() {
        signIn(email: loginView.getEmail(), password: loginView.getPassword())
    }
    
    private func signIn(email: String, password: String) {
        
        if (email.isBlank) {
            loginView.onEmptyEmail()
            return
        }
        //TODO: write method to check if email is valid
//        if (isNotValidEmail(email)) {
//            loginView.onInvalidEmail()
//            return
//        }
        if (password.isBlank) {
            loginView.onEmptyPassword()
            return
        }
        if password.count < 6 {
            loginView.onWeakPassword()
            return
        }
//        loginView.showProgress()
        userInteractor.post(request: LoginRequest(username: email,password: password), {
            _ in
//            self.loginView.dismissProgress()
            self.userNavigator.dashboard()
        }, { error in
            self.onError(error)
        })
    }
}
