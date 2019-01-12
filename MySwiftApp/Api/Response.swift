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

protocol ResponseObject : Response{
    associatedtype T : Decodable
    
    func getResponse() -> T
}

protocol ResponseArray : Response{
    associatedtype T : Decodable
    
    func getResponse() -> Array<T>
}


struct ApiError : Codable, Error {
    
    //map error with - api error field
    var error : String?
    var errorCode: String?
    
    init(error: String?) {
        self.error = error
    }
    
    func isEmailExist() -> Bool {
        return errorCode == "1011"
    }
    
    func isAuthFailure() -> Bool{
        return errorCode == "1109"
    }
    
    enum CodingKeys: String, CodingKey {
        case error = "text"
        case errorCode = "code"
    }
}

struct ErrorResponse : Decodable {
    var error : ApiError
    
    func getError() -> Error? {
        return error
    }
    
    enum CodingKeys: String, CodingKey {
        case error
    }
}

//default response is an arrary returned as data
struct DefaultResponse<R : Decodable> :  Decodable {
    
    typealias T = R
    
    var responseData: Array<T>
    
    func getResponse() -> Array<T> {
        return responseData
    }
    
    func getResponseObject() -> T {
        return getResponse()[0]
    }
    
    enum CodingKeys: String, CodingKey {
        case responseData = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let responseData = try container.decodeIfPresent(Array<T>.self, forKey: .responseData) {
            self.responseData = responseData
        } else {
            responseData = Array()
        }
    }
}
