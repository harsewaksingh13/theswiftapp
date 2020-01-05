//
//  DataManager.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

protocol DataManager {
    func users() -> Users
    
    func session(email: String, token: String)
    
    func hasSession() -> Bool
}


class DataManagerImpl: DataManager {
    
    func users() -> Users {
        return Users()
    }
    
    func session(email: String, token: String) {
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(token, forKey: "token")
    }
    
    func hasSession() -> Bool {
        return (UserDefaults.standard.string(forKey: "token") ?? "").isNotEmpty
    }
}
