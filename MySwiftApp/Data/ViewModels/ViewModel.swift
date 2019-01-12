//
//  ViewModel.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 10/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation

protocol ViewModel {
    
    associatedtype R
    associatedtype T
    
    func post(request: R,_ responseHandler:@escaping ResponseHandler<T>,_ errorHandler:@escaping ErrorHandler)
    
    func put(request: R, responseHandler: ResponseHandler<T>, errorHandler: ErrorHandler)
    
    func get(id: String, responseHandler: ResponseHandler<T>, errorHandler: ErrorHandler)
    
    func delete(id: String, errorHandler: ErrorHandler)
    
    func getAll(responseHandler: ResponseHandler<Array<T>>, errorHandler: ErrorHandler)
    
}
