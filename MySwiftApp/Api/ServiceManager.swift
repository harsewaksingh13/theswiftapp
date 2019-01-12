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
    
    
    let headers = ["Content-Type": "application/json",
                   "client-id": "9xsEQDt9RjgYeWB",
                   "app-platform": "ios"]
    
    let sessionManager = SessionManager.default
    
    
    
    
    func  decodeResponse<R : Decodable> (_ type: R.Type, _ dataResponse: DataResponse<Any>,_ responseHandler: (R) -> Void,_ errorHandler: ErrorHandler)  {
        guard let error = dataResponse.error else {
            if let data = dataResponse.data {
                if let request = dataResponse.request {
                    print("====Url======\n \(String(describing: request.url))")
                    print("====Header====\n \(request.allHTTPHeaderFields as Any)")  // original URL request
                    print("====Body======\n \(NSString(data: (request.httpBody)!, encoding: String.Encoding.utf8.rawValue) as Any)")
                    print("====Response==\n \(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)")
                }
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    errorHandler(errorResponse.error)
                } catch {// if it is failed to parse data then check for error response
                    do {
                        let responseObject =   try JSONDecoder().decode(type, from: data)
                        responseHandler(responseObject)
                    } catch let err {
                        print("Decoding Error= \(err)")
                        errorHandler(ApiError(error: String(describing: err)))
                    }
                }
            }
            return
        }
        errorHandler(error)
    }
    
    func login(loginRequest: LoginRequest,_ responseHandler:@escaping ResponseHandler<AuthResponse>,_ errorHandler:@escaping ErrorHandler) -> DataRequest{
        return  sessionManager.post(url: Services.login.service, parameters: loginRequest.dictionary,
                                    headers: headers).responseJSON(
                                        completionHandler: { response in
                                            self.decodeResponse(DefaultResponse<AuthResponse>.self, response, {
                                                defaultResponse in
                                                responseHandler(defaultResponse.getResponseObject())
                                            }, errorHandler)
                                    })
        
//        sessionManager.post(url: Services.login.service, parameters: loginRequest.dictionary,
//                            headers: headers).responseDefault(completionHandler: {
//                                response in
//                                
//                            })
    }
    
}




