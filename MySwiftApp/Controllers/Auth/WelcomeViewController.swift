//
//  WelcomeViewController.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

protocol WelcomeController : Controller {
    func emailClicked()
    
    func facebookClicked()
    
    func googleClicked()
}

protocol WelcomeView : View {
    
    func openLoginScreen()
    
    func openMainScreen()
    
    func displayEmailExistError()
}


class WelcomeViewController : BaseViewController<WelcomeControllerImpl> , WelcomeView {
    
    @IBOutlet weak var emailButton: UIButton!
    
    func initController() -> WelcomeController {
        return WelcomeControllerImpl(welcomeView: self)
    }
    
    override func viewDidLoad() {
            
    }
    
    func openLoginScreen() {
       controller?.emailClicked()
    }
    
    
    func openMainScreen() {
        
    }
    
    
    func displayEmailExistError() {
        
    }
    
}
