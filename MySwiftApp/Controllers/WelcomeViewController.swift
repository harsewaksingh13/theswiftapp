//
//  WelcomeViewController.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

protocol WelcomeController {
    func emailClicked()
    
    func facebookClicked()
    
    func googleClicked()
}

protocol WelcomeView {
    
    func openLoginScreen()
    
    func openMainScreen()
}


class WelcomeViewController : UIViewController,WelcomeView {
    
    var presenter : WelcomeController?
    
    override func viewDidLoad() {
        presenter = WelcomeControllerImpl(view: self,dataManager: appDelegate.dataManager)
    }
    
    func openLoginScreen() {
        
    }
    
    func openMainScreen() {
        
    }
    
    
}
