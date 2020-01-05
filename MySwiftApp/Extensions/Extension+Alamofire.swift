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
    
    
    func get(url: Service, parameters: Encodable? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return request(url: url,method: HTTPMethod.get,parameters: parameters,headers: headers)
    }
    
    func post(url: Service,  parameters: Encodable? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return self.request(url: url,method: HTTPMethod.post,parameters: parameters,headers: headers)
    }
    
    func put(url: Service,  parameters: Encodable? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return request(url: url,method: HTTPMethod.put,parameters: parameters,headers: headers)
    }
    
    func delete(url: Service,  parameters: Encodable? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        return request(url: url,method: HTTPMethod.delete,parameters: parameters,headers: headers)
    }
    
    private func request(url: Service, method: HTTPMethod = .get, parameters: Encodable? = nil, headers: HTTPHeaders? = nil) -> DataRequest{
        var defaultHeaders = headers
        if(headers == nil){
            defaultHeaders = ["Content-Type": "application/json",
             "client-id": "9xsEQDt9RjgYeWB",
             "app-platform": "ios"]
        }
        if let token = UserDefaults.standard.string(forKey: "token") {
            defaultHeaders?.updateValue(token, forKey: "token")
        }

        return  self.request(url.service,method: method, parameters: parameters?.dictionary, encoding: JSONEncoding.default,headers:defaultHeaders)
    }
}

extension DataRequest {
    
    
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<DefaultResponse<T>> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try JSONDecoder.decoder.decode(DefaultResponse<T>.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<DefaultResponse<T>>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
   
    //decode json response object is response is wrapped in data which is represented by DefaultResponseObject class
    func  decodeJSONResponse<R : Decodable> (_ responseHandler: @escaping (R) -> Void,_ errorHandler: @escaping ErrorHandler) -> DataRequest {
        self.responseJSON(
            completionHandler: { response in
                self.decodeResponse(DefaultResponseObject<R>.self, response, {
                    defaultResponse in
                    if let response = defaultResponse.getResponse(){
                        responseHandler(response)
                    }else {
                        errorHandler(ApiError(error: "No data returned"))
                    }
                }, errorHandler)
        })
        
        return self
    }
    
    //for all DefaultResponse objects
    func  decodeJSONArrayResponse<R : Decodable> (_ responseHandler: @escaping ([R]) -> Void,_ errorHandler: @escaping ErrorHandler) -> DataRequest {
        self.responseJSON(
            completionHandler: { response in
                self.decodeResponse(DefaultResponse<R>.self, response, {
                    defaultResponse in
                    responseHandler(defaultResponse.getResponse())
                }, errorHandler)
        })
        
        return self
    }
    
    
    func  decodeJSONResponse<R : Decodable> (_ type: R.Type,_ responseHandler: @escaping (R) -> Void,_ errorHandler: @escaping ErrorHandler) -> DataRequest {
        self.responseJSON(
            completionHandler: { response in
                self.decodeResponse(type, response, {
                    defaultResponse in
                    responseHandler(defaultResponse)
                }, errorHandler)
        })
        
        return self
    }

    
    func  decodeResponse<R : Decodable> (_ type: R.Type, _ dataResponse: DataResponse<Any>,_ responseHandler: (R) -> Void,_ errorHandler: ErrorHandler)  {
        guard let error = dataResponse.error else {
            if let data = dataResponse.data {
                if let request = dataResponse.request {
                    let url = request.url ?? URL(fileURLWithPath: "No Url")
                    let method = request.httpMethod ?? ""
                    print("====Url======\n \(String(describing: url)) - \(method)")
                    let header = request.allHTTPHeaderFields ?? ["header":"No Header"]
                    print("====Header====\n \(header)")  // original URL request
                    if let httpBody = request.httpBody, let body = NSString(data: httpBody, encoding: String.Encoding.utf8.rawValue){
                        print("====Body======\n \(body)")
                    }
                    if let response = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                     print("====Response==\n \(response)")
                    }
                }
                do {
                    let errorResponse = try JSONDecoder.decoder.decode(ErrorResponse.self, from: data)
                    errorHandler(errorResponse.getError())
                } catch {// if it is failed to parse data then check for data response
                    do {
                        let responseObject =   try JSONDecoder.decoder.decode(type, from: data)
                        responseHandler(responseObject)
                    } catch let err {
                        print("Decoding Error= \(err)")
                        
                        var describedError = String(describing: err)
                        if(describedError.contains("No value associated with key CodingKeys")) {
                                describedError = "Unable to handle returned response!"
                        }
                        errorHandler(ApiError(error: describedError))
                    }
                }
            }
            return
        }
        errorHandler(error)
    }
    

}



