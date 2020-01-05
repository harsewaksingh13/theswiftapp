//
//  Users.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

class Users: DatabaseTableImpl<User> {
    
    override func save(obj: User) {
        super.save(obj: obj)
    }
    
    override func objId(obj: User) -> String {
        return obj.id
    }
    
}
