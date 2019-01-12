//
//  LoginControllerImpl.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 11/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation

class LoginControllerImpl :BaseController, LoginController {
    
    let loginView : LoginView
    let userViewModel: UserViewModel
    
    init(view: LoginView, userViewModel: UserViewModel) {
        self.loginView = view
        self.userViewModel = userViewModel
        super.init(view: view)
    }
    
    func onLoginClicked() {
        login(email: loginView.getEmail(), password: loginView.getPassword())
    }
    
    private func login(email: String, password: String) {
        
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
        //loginView.showProgress()
        
        //userViewModel.post(LoginRequest(email, password), { view.onSuccessLogin() },{onError(it)}))
       
        userViewModel.post(request: LoginRequest(username: email,password: password), {
            _ in
            self.loginView.openSuccessLogin()
        }, { error in
            self.onError(error)
        })
    }
}
