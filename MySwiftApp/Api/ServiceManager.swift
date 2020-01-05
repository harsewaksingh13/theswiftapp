//
//  ServiceManager.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 20/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation
import Alamofire


protocol ServiceManager {
    
    func login(loginRequest: LoginRequest,_ responseHandler:@escaping ResponseHandler<AuthResponse>,_ errorHandler:@escaping ErrorHandler) -> DataRequest
}


typealias ResponseHandler<T> = (T) -> Void

typealias ErrorHandler = (Error) -> Void

class ServiceManagerImpl: ServiceManager {
    
    
    let sessionManager = SessionManager.default
    
    
    func login(loginRequest: LoginRequest, _ responseHandler: @escaping ResponseHandler<AuthResponse>, _ errorHandler: @escaping ErrorHandler) -> DataRequest {
        return sessionManager.post(url: Service.login, parameters: loginRequest).decodeJSONResponse(AuthResponse.self, responseHandler, errorHandler)
    }
    
}




