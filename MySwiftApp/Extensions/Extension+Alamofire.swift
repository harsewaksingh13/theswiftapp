//
//  Extension+SessionManager.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 11/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation
import Alamofire

extension SessionManager{
    
    
    func get(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return request(url: url,method: HTTPMethod.put,parameters: parameters,headers: headers)
    }
    
    func post(url: String,  parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return self.request(url: url,method: HTTPMethod.post,parameters: parameters,headers: headers)
    }
    
    func put(url: String,  parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return request(url: url,method: HTTPMethod.put,parameters: parameters,headers: headers)
    }
    
    func delete(url: String,  parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return request(url: url,method: HTTPMethod.delete,parameters: parameters,headers: headers)
    }
    
    private func request(url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return self.request(url,method: method, parameters: parameters, encoding: JSONEncoding.default,headers:headers)
    }
}

extension DataRequest {
    
    
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<DefaultResponse<T>> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try JSONDecoder().decode(DefaultResponse<T>.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<DefaultResponse<T>>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
   
    func  decodeResponse<R : Decodable> (_ type: R.Type, _ dataResponse: DataResponse<Any>,_ responseHandler: (R) -> Void,_ errorHandler: ErrorHandler) -> DataRequest {
        
        
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
            return self
        }
        errorHandler(error)
        return self
    }
    
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
    
    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
}
