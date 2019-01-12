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
    
    
    let username, userID: String
    let dateCreated: Int
    let surname: String
    let forename: String
    let isVerified: Bool
    let lastLoginMethod : String
    
    let lastLogin: Int? = nil
    let registrationMethod: String? = nil
    let clientID: String? = nil
    let gender: String? = nil
    let isRepeatVerified: String? = nil
    let lang: String? = nil
    let nhsNumber: String? = nil
    let postcode: String? = nil
    let previousUsernames: String? = nil
    let roles: [String]? = nil
    let schemeNumber: String? = nil
    let takers: String? = nil
    let telephone: String? = nil
    let address: String? = nil
    let birthday: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case username
        case userID = "user_id"
        case address, birthday
        case clientID = "client_id"
        case dateCreated = "date_created"
        case forename, gender
        case isRepeatVerified = "is_repeat_verified"
        case isVerified = "is_verified"
        case lang
        case lastLogin = "last_login"
        case lastLoginMethod = "last_login_method"
        case nhsNumber = "nhs_number"
        case postcode
        case previousUsernames = "previous_usernames"
        case registrationMethod = "registration_method"
        case roles
        case schemeNumber = "scheme_number"
        case surname, takers, telephone
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userID = try container.decode(String.self, forKey: .userID)
        forename = try container.decode(String.self, forKey: .forename)
        surname = try container.decode(String.self, forKey: .surname)
        username = try container.decode(String.self, forKey: .username)
        dateCreated = try container.decode(Int.self, forKey: .dateCreated)
        lastLoginMethod = try container.decodeIfPresent(String.self, forKey:.lastLoginMethod) ?? "email"
        isVerified = try container.decode(Bool.self,forKey:.isVerified)
    }
    
    func toUser() -> User {
        return User(forename: forename,surname: surname,email: username)
    }
    
}






