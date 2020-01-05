//
//  Table.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 05/01/2020.
//  Copyright © 2020 Harsewak Singh. All rights reserved.
//

import Foundation

protocol DatabaseTable {
    associatedtype T
    
    func save(obj: T)
    
    func delete(obj: T)
    
    func get(id: String) -> T?
    
    func getAll() -> Array<T>
}

class DatabaseTableImpl<M> : DatabaseTable {
    
    var elements: [M] = []
    
    func objId(obj: M) -> String {
        return ""
    }
    
    func save(obj: M) {
        if let index = elements.firstIndex(where: {objId(obj:$0) == objId(obj: obj)}){
            elements.remove(at: index)
            elements.insert(obj, at: index)
        }else {
            elements.append(obj)
        }
    }
    
    func delete(obj: M) {
        
    }
    
    func get(id: String) -> M? {
        return elements.first(where: {objId(obj: $0) == id})
    }
    
    func getAll() -> [M] {
        return elements
    }
    
    typealias T = M
}
