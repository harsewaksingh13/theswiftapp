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
    func setBackgroundColor(color: UIColor)
    //display error on UI
    func onError(error: String)
}

protocol AppManager {
    var dataManager: DataManager { get }
    var serviceManager: ServiceManager { get }
    var navigator: Navigator? { get }
}

class BaseController : Controller {
    
    var view : View
    
    init(view: View){
        self.view = view
    }
    
    func viewDidLoad() {
        view.setBackgroundColor(color: .white)
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
    
    var safeAreaView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSafeArea()
        controller = initController()
        controller?.viewDidLoad()
        self.navigationController?.enableSegue()
    }
    
    func setupSafeArea() {
        view.addSubview(safeAreaView)
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                safeAreaView.topAnchor.constraint(equalTo: guide.topAnchor),
                safeAreaView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
                safeAreaView.leftAnchor.constraint(equalTo: guide.leftAnchor),
                safeAreaView.rightAnchor.constraint(equalTo: guide.rightAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                safeAreaView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                safeAreaView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                safeAreaView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
                safeAreaView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
            ])
        }
        
    }
    
    func setBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
        safeAreaView.backgroundColor = color
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

