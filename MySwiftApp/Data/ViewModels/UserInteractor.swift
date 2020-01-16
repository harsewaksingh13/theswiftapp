//
//  UserViewModel.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 10/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation
//handle both login and register encodable requests
class UserInteractor : BaseInteractor<Encodable,User> {
   
    override func post(request: Encodable,_ responseHandler:@escaping ResponseHandler<User>,_ errorHandler: @escaping ErrorHandler) {
        if let request = request as? LoginRequest {
            _ = serviceManager.login(loginRequest: request, {
                response in
                let user = response.user.toUser()
                self.dataManager.session(email: user.email, token: response.token)
                self.dataManager.users().save(obj: user)
                responseHandler(user)
            }, errorHandler)
        } else if let request = request as? CreateAccountRequest {
            _ = serviceManager.createAccount(createAccountRequest: request, {
                response in
                let user = response.user.toUser()
                self.dataManager.session(email: user.email, token: response.token)
                self.dataManager.users().save(obj: user)
                responseHandler(user)
            }, errorHandler)
        }
    }
    
    
    func put(request: Encodable, _ responseHandler: ResponseHandler<User>, _ errorHandler: ErrorHandler) {
        
    }
    

    
    func getAll(_ responseHandler: ResponseHandler<Array<User>>, _ errorHandler: ErrorHandler) {
    
    }
    
    override func get(_ responseHandler: @escaping (User) -> Void, _ errorHandler: @escaping ErrorHandler) {
        
    }
    
    override func delete(id: String, _ responseHandler: @escaping ResponseHandler<Bool>, _ errorHandler: @escaping ErrorHandler) {
        
    }

}
