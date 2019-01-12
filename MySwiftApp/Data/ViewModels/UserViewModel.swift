//
//  UserViewModel.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 10/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation

class UserViewModel : ViewModel {
   
    
    typealias T = User
    
    typealias R = LoginRequest
    
    
    let serviceManager: ServiceManager
    let dataManager: DataManager
    
    init(serviceManager: ServiceManager, dataManager: DataManager) {
        self.serviceManager = serviceManager
        self.dataManager = dataManager
    }
    
    func post(request: LoginRequest,_ responseHandler:@escaping ResponseHandler<User>,_ errorHandler: @escaping ErrorHandler) {
        _ = serviceManager.login(loginRequest: request, {
            response in
            let user = response.user.toUser()
            self.dataManager.session(email: user.email, token: response.token)
            self.dataManager.users().save(obj: user)
            responseHandler(user)
        }, errorHandler)
    }
    
    
    func put(request: LoginRequest, responseHandler: ResponseHandler<User>, errorHandler: ErrorHandler) {
        
    }
    
    func delete(id: String, errorHandler: ErrorHandler) {
        
    }
    
    func getAll(responseHandler: ResponseHandler<Array<User>>, errorHandler: ErrorHandler) {
    
    }
    
    func get(id: String, responseHandler: ResponseHandler<User>, errorHandler: ErrorHandler)  {
    
    }

}
