//
//  Users.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

class Users: DatabaseTable {
    
    typealias T = User
    
    func save(obj: User) {
        
    }
    
    func delete(obj: User) {
        
    }
    
    func get(id: String) -> User? {
        return nil
    }
    
    
    func getAll() -> Array<User> {
        return Array()
    }
}
