//
//  ViewModel.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 10/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation
import Alamofire

protocol Interactor {
    
    associatedtype R
    associatedtype T
    
    func post(request: R,_ responseHandler:@escaping ResponseHandler<T>,_ errorHandler:@escaping ErrorHandler)
    
    func put(request: R,_ responseHandler:@escaping ResponseHandler<T>,_ errorHandler:@escaping ErrorHandler)
    
    func get(_ responseHandler:@escaping ResponseHandler<T>,_ errorHandler:@escaping ErrorHandler)
    
    func delete(id: String,_ responseHandler:@escaping ResponseHandler<Bool>,_ errorHandler:@escaping ErrorHandler)
    
    func getAll(_ responseHandler:@escaping ResponseHandler<[T]>,_ errorHandler:@escaping ErrorHandler)
    
}

//create default base class so serviceManager, dataManager instances will be used in all subclasses
class BaseInteractor<Req,Res>: Interactor {
    
    //T is response object
    typealias T = Res
    //R is request
    typealias R = Req
    
    let serviceManager: ServiceManager
    let dataManager: DataManager
    
    var dataRequest: DataRequest?
    
    convenience init(appManager: AppManager) {
        self.init(serviceManager:appManager.serviceManager,dataManager:appManager.dataManager)
    }
    
    init(serviceManager: ServiceManager, dataManager: DataManager) {
        self.serviceManager = serviceManager
        self.dataManager = dataManager
    }
    
    func post(request: R,_ responseHandler:@escaping ResponseHandler<Res>,_ errorHandler:@escaping ErrorHandler){
        
    }
    
    func put(request: R,_ responseHandler:@escaping ResponseHandler<Res>,_ errorHandler:@escaping ErrorHandler){
        
    }
    
    func get(_ responseHandler:@escaping ResponseHandler<Res>,_ errorHandler:@escaping ErrorHandler){
        
    }
    
    func delete(id: String,_ responseHandler:@escaping ResponseHandler<Bool>,_ errorHandler:@escaping ErrorHandler){
        
    }
    
    func getAll(_ responseHandler:@escaping ResponseHandler<[Res]>,_ errorHandler:@escaping ErrorHandler){
        
    }
    
    func cancel()  {
        dataRequest?.cancel()
    }
    
}

