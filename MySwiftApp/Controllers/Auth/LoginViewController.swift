//
//  LoginViewController.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

protocol LoginView : View {
    func openSuccessLogin()
    func getEmail() -> String
    func getPassword() -> String
    func onEmptyEmail()
    func onEmptyPassword()
    func onInvalidEmail()
    func onWeakPassword()
}

protocol LoginController {
    func onLoginClicked()
}

class LoginViewController: BaseViewController<LoginControllerImpl>, LoginView {
    
    
    
    override func initController() -> LoginControllerImpl {
        return LoginControllerImpl(view: self, userViewModel: UserViewModel(serviceManager: appDelegate.serviceManager, dataManager: appDelegate.dataManager))
    }
    
   
    
    @IBAction func loginDidClick(_ sender: UIButton) {
        controller?.onLoginClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    func getEmail() -> String {
        return "healthera.mobile@gmail.com" //TODO read from textField
    }
    
    func getPassword() -> String {
        return "Healthera01" //TODO read from textField
    }
    
    func onEmptyEmail() {
        
    }
    
    func onEmptyPassword() {
        
    }
    
    func onInvalidEmail() {
        
    }
    
    func onWeakPassword() {
        
    }
    
    func openSuccessLogin() {
        
    }
    
    
}
