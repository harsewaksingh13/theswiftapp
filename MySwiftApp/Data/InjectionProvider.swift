//
//  InjectionProvider.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 01/04/2021.
//  Copyright © 2021 Harsewak Singh. All rights reserved.
//

import Foundation


@propertyWrapper
public struct Inject<T> {
    private var instance: T
    public init() {
        self.instance = InstanceProvider.provide(T.self)
    }
    
    public var wrappedValue: T {
        get { return instance }
    }
}

fileprivate class InstanceProvider<T> {
    
    static func provide(_ type: T.Type) -> T {
        if type == DataManager.self {
            return DataManagerImpl() as! T
        } else if type == ServiceManager.self {
            return ServiceManagerImpl() as! T
        } else if type == AppNavigator.self {
            return AppNavigation() as! T
        } else if type == UserInteractor.self {
            return UserInteractor() as! T
        }
        
        fatalError("InstanceProvider => Unrecognised type \(type) with Inject!")
    }
}

