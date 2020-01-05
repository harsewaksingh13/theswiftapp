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
    func createAccount()
    func signIn()
}

protocol WelcomeView : View {
    
    
}


class WelcomeViewController : BaseViewController<WelcomeControllerImpl> , WelcomeView {
    
    let createAccountButton = UIViewFactory.shared.button(text: Strings.createAccount)
    let signInButton = UIViewFactory.shared.textButton(text: Strings.signIn)
    
    override func initController() -> WelcomeControllerImpl {
        return WelcomeControllerImpl(welcomeView: self, userNavigator: UserNavigatorImpl(navigation:self.navigationController))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeAreaView.addSubView(views: createAccountButton,signInButton)
        safeAreaView.addHorizontalVisualConstraint(views: createAccountButton,signInButton)
        safeAreaView.addVerticalVisualConstraint(views: [createAccountButton,signInButton])
        
        self.signInButton.addTarget(self, action: #selector(signInDidClick), for: .touchUpInside)
        self.createAccountButton.addTarget(self, action: #selector(createAccountDidClick), for: .touchUpInside)
    }
    
    @objc func signInDidClick()  {
        self.controller?.signIn()
    }
    
    @objc func createAccountDidClick() {
        self.controller?.createAccount()
    }
    
}
