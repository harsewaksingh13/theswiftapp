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
}

protocol DatabaseTable {
    associatedtype T
    
    func save(obj: T)
    
    func delete(obj: T)
    
    func get(id: String) -> T?
    
    func getAll() -> Array<T>
}


class DataManagerImpl: DataManager {
    
    func users() -> Users {
        return Users()
    }
    
    func session(email: String, token: String) {
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(token, forKey: "token")
    }
}
