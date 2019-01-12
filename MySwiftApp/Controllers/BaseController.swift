//
//  BaseController.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 28/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

protocol Controller {
    
    func viewDidLoad()
    
}

protocol View {
    //display error on UI
    
    func onError(error: String)
}

class BaseController : Controller {
    
    var view : View
    
    init(view: View){
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func onError(_ error: Error) {
        //display the error on the view page
        if let error = error as? ApiError {
            onError(error)
        } else {
            view.onError(error: error.localizedDescription)
        }
    }
    
    func onError(_ apiError: ApiError)  {
        if(apiError.isAuthFailure()){
            
        }
        if let error = apiError.error {
            view.onError(error: error)
        }
    }
    
}

//MARK: a base class for UIViewController
class BaseViewController<C: Controller> : UIViewController, View {
    
    var controller: C?
    
    override func viewDidLoad() {
        controller = initController()
        controller?.viewDidLoad()
    }
    
    func initController() -> C {
        return BaseController(view: self) as! C
    }
    
    func onError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

