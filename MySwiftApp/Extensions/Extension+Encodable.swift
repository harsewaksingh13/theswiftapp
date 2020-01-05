//
//  Extension+Encodable.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 28/11/2018.
//  Copyright © 2018 Harsewak Singh. All rights reserved.
//

import Foundation


extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder.encoder.encode(self))) as? [String: Any] ?? [:]
    }
}

extension JSONDecoder {
    
    static var decoder : JSONDecoder {
        get {
            let decoder =  JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            return decoder
        }
    }
    
}

extension JSONEncoder {
    
    static var encoder :  JSONEncoder{
        get{
            let encoder =  JSONEncoder()
            encoder.dateEncodingStrategy = .custom({
                (date,encoder) throws in
                var container = encoder.singleValueContainer()
                try container.encode(date.epoch)
            })
            return encoder
        }
    }
}
