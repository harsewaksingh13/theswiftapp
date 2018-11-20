//
//  ServiceManager.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

struct LoginRequest{
    let username: String
    let password: String
}

protocol ServiceManager {
    func login(loginRequest: LoginRequest)
}



class ServiceManagerImpl: ServiceManager {
    
    
    func login(loginRequest: LoginRequest) {
        
    }
    
}
