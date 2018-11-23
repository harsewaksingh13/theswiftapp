//
//  Response.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 21/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation

protocol Response {
    func getError() -> Error?
}

protocol ResponseObject {
    associatedtype T
    
    func getResponse() -> T
}

protocol ResponseArray {
    associatedtype T
    
    func getResponse() -> Array<T>
}


struct ApiError : Error {
    
    //map error with - api error field
    var error : String?
    
}

//default response is an arrary returned as data
struct DefaultResponse<R> : Response, ResponseArray {
    
    typealias T = R
    
    var data: Array<T>
    
    func getResponse() -> Array<T> {
        return data
    }
    
    var error : ApiError?
    
    func getError() -> Error? {
        return error
    }
}
