//
//  Services.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 13/12/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

enum Services {

   // typealias Service = String
    
    case baseUrl
    case login
    case logOut
    case getAllAdherences(String)
    case getPatientSpecificRemedies(String, String)
    
    
    var service : String {
         let baseUrl = "https://api.84r.co"
        switch self {
        case .baseUrl:
            return ""
        case .login, .logOut:
            return "\(baseUrl)/tokens"
            
        case .getAllAdherences(let patientId):
            return "\(baseUrl)/patients/\(patientId)/adherences?start=&end="
            
        case .getPatientSpecificRemedies(let patientId, let remedyId):
            return "\(baseUrl)/patients/\(patientId)/remedies/\(remedyId)"
        }
    }
}

