//
//  WelcomeControllerPresenter.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation


class WelcomeControllerImpl: WelcomeController {
    
    var view : WelcomeView
    
    
    init(view: WelcomeView,dataManager: DataManager) {
        self.view = view
    }
    
    func emailClicked() {
        view.openLoginScreen()
    }
    
    func facebookClicked() {
        
    }
    
    func googleClicked() {
        
    }
    
    
}
