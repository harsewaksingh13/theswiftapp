//
//  Services.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 13/12/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

protocol ServiceP {
    var url : String { get }
}

enum Service {
    
    // typealias Service = String
    
    case login
    case register
    case user(String)
    
    
    var service : String {
        let baseUrl = "localhost:3000"
        var endpointUrl = ""
        switch self {
        case .login:
            endpointUrl = "/tokens"
            break
        case  .register:
            endpointUrl = "/users"
            break
        case .user(let id):
            endpointUrl = "/users/\(id)"
            break
        }
        return "\(baseUrl)"+endpointUrl
    }
}

