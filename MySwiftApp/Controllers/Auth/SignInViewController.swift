//
//  LoginViewController.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

protocol SignInView : View {
    func getEmail() -> String
    func getPassword() -> String
    func onEmptyEmail()
    func onEmptyPassword()
    func onInvalidEmail()
    func onWeakPassword()
}

protocol SignInPresenter {
    func signIn()
}

class SignInViewController: BaseViewController<SignInPresenterImpl>, SignInView {
        
    override func initPresenter() -> SignInPresenterImpl {
        return SignInPresenterImpl(view: self, userInteractor: UserInteractor(appManager: appDelegate), userNavigator: UserNavigatorImpl(navigation:self.navigationController))
    }
    
    @IBAction func loginDidClick(_ sender: UIButton) {
        presenter?.signIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    func getEmail() -> String {
        return "harsewak@gmail.com" //TODO read from textField
    }
    
    func getPassword() -> String {
        return "Harsewak01" //TODO read from textField
    }
    
    func onEmptyEmail() {
        
    }
    
    func onEmptyPassword() {
        
    }
    
    func onInvalidEmail() {
        
    }
    
    func onWeakPassword() {
        
    }
    
}
