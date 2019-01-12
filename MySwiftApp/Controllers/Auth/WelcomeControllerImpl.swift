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
    
    init(welcomeView view: WelcomeView) {
        self.welcomeView = view
        super.init(view: welcomeView)
    }
    
    func emailClicked() {
        welcomeView.openLoginScreen()
    }
    
    func facebookClicked() {
        
    }
    
    func googleClicked() {
        
    }
    
    
    override func onError(_ error: Error) {
        super.onError(error)
        let apiError = error as! ApiError
        if apiError.isEmailExist() {
            welcomeView.displayEmailExistError();
        }
    }
    
}
