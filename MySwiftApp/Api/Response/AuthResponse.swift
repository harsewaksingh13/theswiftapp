//
//  UserResponse.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 28/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

struct AuthResponse : Decodable {
    
    let token: String
    
    let user : UserResponse
    
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}

struct UserResponse : Decodable {
    
    
    let email, id: String
    let surname: String
    let forename: String
    
    
    enum CodingKeys: String, CodingKey {
        case email
        case id = "user_id"
        case forename
        case surname
    }

    
    func toUser() -> User {
        return User(id: id,forename: forename,surname: surname,email: email)
    }
    
}






