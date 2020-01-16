//
//  LoginRequest.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 28/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

struct LoginRequest : Encodable{
    let username: String
    let password: String
    
    public enum CodingKeys: String, CodingKey {
        case password = "user_password"
        case username
    }
}

struct CreateAccountRequest : Encodable {
    var firstName: String
    var lastName : String
}
