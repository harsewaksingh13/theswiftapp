//
//  LoginControllerImpl.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 11/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation

class SignInPresenterImpl: BasePresenter, SignInPresenter {
    
    
    let loginView : SignInView
    @Inject var userInteractor: UserInteractor
    @Inject var navigator: AppNavigator
    
    init(view: SignInView) {
        self.loginView = view
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
          [weak self]  _ in
//            self.loginView.dismissProgress()
            self?.navigator.auth.dashboard()
        }, { error in
            self.onError(error)
        })
    }
}
